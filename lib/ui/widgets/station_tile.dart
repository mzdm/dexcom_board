import 'package:auto_route/auto_route.dart';
import 'package:dexcom_board/navigation/app_router.gr.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_share_api/dexcom_models.dart';
import 'package:flutter/material.dart';

class StationTile extends StatelessWidget {
  const StationTile({
    super.key,
    required this.stationId,
    required this.station,
  });

  final String stationId;
  final StationModel station;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(PatientDetailRoute(stationId: stationId, station: station));
      },
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(station.stationName, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
