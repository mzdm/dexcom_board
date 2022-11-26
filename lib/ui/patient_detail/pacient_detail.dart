import 'package:auto_route/auto_route.dart';
import 'package:dexcom_board/services/active_user_dex_clients.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/services/models/station_dao.dart';
import 'package:dexcom_board/ui/widgets/line_chart_widget.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:dexcom_share_api/dexcom_share_api.dart';
import 'package:flutter/material.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({
    super.key,
    required this.stationId,
    required this.station,
  });

  final String stationId;
  final StationModel station;

  ActiveUserDexClients get activeUserDexClients => locator<ActiveUserDexClients>();

  StationModelDao get stationModelDao => locator<StationModelDao>();

  Future<List<GlucoseEventRecord>> _get() async {
    final dexClient = activeUserDexClients.getDexClient(stationId);
    if (dexClient == null) {
      final client = DexcomUserApi();
      final state = await client.init(username: station.username, password: station.password);
      if (state.isLeft) {
        throw Exception('Failed to login');
      }
      activeUserDexClients.addStation(stationId, client);
    }

    final save = await dexClient?.getGlucoseEventRecords(minutes: 300);
    if (save == null || save.isLeft) {
      throw Exception('Failed to fetch latest glucose data');
    }
    return save.isRight ? save.right : [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Station detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
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
            child: Column(
              children: [
                LineChartWidget(),
                FutureBuilder(
                  future: _get(),
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (data == null) {
                      return const SizedBox.shrink();
                    } else {
                      return ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return ListTile(
                            title: Text('Item ${item.toString()} ${item.Trend?.trendArrow}'),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
