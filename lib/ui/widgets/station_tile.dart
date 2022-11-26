import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:dexcom_board/navigation/app_router.gr.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/services/models/glucose_event_records_dao.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:flutter/material.dart';

class StationTile extends StatelessWidget {
  const StationTile({
    super.key,
    required this.stationId,
    required this.station,
  });

  final String stationId;
  final StationModel station;

  GlucoseEventRecordsDao get glucoseEventRecordsDao => locator.get<GlucoseEventRecordsDao>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(PatientDetailRoute(stationId: stationId, station: station));
      },
      child: Container(
        color: Colors.black,
        child: StreamBuilder<GlucoseListEventRecords>(
            stream: glucoseEventRecordsDao.getAllGlucoseListEventRecordsStream(stationId),
            builder: (context, snapshot) {
              final data = snapshot.data?.eventRecords;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(station.stationName, style: TextStyle(color: Colors.white)),
                  Text(
                    'Latest value: ${data?.firstOrNull?.WT}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
