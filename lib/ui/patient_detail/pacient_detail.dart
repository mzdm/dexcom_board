import 'package:auto_route/auto_route.dart';
import 'package:dexcom_board/services/active_user_dex_clients.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/services/models/glucose_event_records_dao.dart';
import 'package:dexcom_board/services/models/station_dao.dart';
import 'package:dexcom_board/services/time_refresh_service.dart';
import 'package:dexcom_board/ui/widgets/line_chart_widget.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:dexcom_share_api/dexcom_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({
    super.key,
    required this.stationId,
    required this.station,
  });

  final String stationId;
  final StationModel station;

  ActiveUserDexClients get activeUserDexClients =>
      locator.get<ActiveUserDexClients>();

  StationModelDao get stationModelDao => locator.get<StationModelDao>();

  TimeRefreshService get timerRefresher => locator.get<TimeRefreshService>();

  GlucoseEventRecordsDao get glucoseEventRecordsDao =>
      locator.get<GlucoseEventRecordsDao>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Station detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              //
              // final data = await glucoseEventRecordsDao.store.query().getSnapshots(glucoseEventRecordsDao.db);
              // print(data.first.key);
              await timerRefresher.refreshData(stationId, station);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              activeUserDexClients.removeStation(stationId);
              await stationModelDao.deleteStation(stationId);
              await AutoRouter.of(context).pop();
            },
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder<GlucoseListEventRecords>(
          stream: glucoseEventRecordsDao
              .getAllGlucoseListEventRecordsStream(stationId),
          builder: (context, snapshot) {
            final allData = snapshot.data?.eventRecords;

            if (allData == null) return const Text('No data found.');

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.75,
                        height: constraints.maxHeight,
                        child: LineChartWidget(data: allData),
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.25,
                        height: constraints.maxHeight,
                        child: SingleChildScrollView(
                          child: Table(
                            border: TableBorder.all(),
                            columnWidths: const {
                              0: FlexColumnWidth(),
                              1: FlexColumnWidth(),
                              2: FlexColumnWidth(),
                            },
                            children: [
                              const TableRow(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      'Time',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      'Value',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      'Trend',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              for (var dataRow in allData) getTableRow(dataRow),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  TableRow getTableRow(GlucoseEventRecord dataRow) {
    String formattedDate = '';
    if (dataRow.WT != null) {
      formattedDate = DateFormat('dd. MM. kk:mm').format(dataRow.WT!);
    }

    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            formattedDate,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            '${dataRow.glucoseValueEu}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            '${dataRow.Trend?.trendArrow}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15.0),
          ),
        ),
      ],
    );
  }
}
