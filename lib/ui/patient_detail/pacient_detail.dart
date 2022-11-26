import 'package:auto_route/auto_route.dart';
import 'package:dexcom_board/services/active_user_dex_clients.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/services/models/glucose_event_records_dao.dart';
import 'package:dexcom_board/services/models/station_dao.dart';
import 'package:dexcom_board/services/time_refresh_service.dart';
import 'package:dexcom_board/ui/widgets/line_chart_widget.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:flutter/material.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({
    super.key,
    required this.stationId,
    required this.station,
  });

  final String stationId;
  final StationModel station;

  ActiveUserDexClients get activeUserDexClients => locator.get<ActiveUserDexClients>();

  StationModelDao get stationModelDao => locator.get<StationModelDao>();

  TimeRefreshService get timerRefresher => locator.get<TimeRefreshService>();

  GlucoseEventRecordsDao get glucoseEventRecordsDao => locator.get<GlucoseEventRecordsDao>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Station detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh data in station',
            onPressed: () async {
              //
              // final data = await glucoseEventRecordsDao.store.query().getSnapshots(glucoseEventRecordsDao.db);
              // print(data.first.key);
              await timerRefresher.refreshData(stationId, station);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete station',
            onPressed: () async {
              activeUserDexClients.removeStation(stationId);
              await stationModelDao.deleteStation(stationId);
              AutoRouter.of(context).pop();
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: StreamBuilder<GlucoseListEventRecords>(
              stream: glucoseEventRecordsDao.getAllGlucoseListEventRecordsStream(stationId),
              builder: (context, snapshot) {
                final allData = snapshot.data?.eventRecords;
                return Column(
                  children: [
                    LineChartWidget(data: allData),
                    if (allData == null)
                      Text('No data found.')
                    else
                      ListView.builder(
                        itemCount: allData.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = allData[index];
                          return ListTile(
                            title: Text(
                              '${index + 1}. value ${item.glucoseValueEu ?? ''} (${item.WT ?? ''}) ${item.Trend?.trendArrow ?? ''}',
                            ),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
