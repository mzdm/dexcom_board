import 'package:auto_route/auto_route.dart';
import 'package:dexcom_board/navigation/app_router.gr.dart';
import 'package:dexcom_share_api/dexcom_models.dart';
import 'package:flutter/material.dart';

class StationTile extends StatelessWidget {
  const StationTile({
    super.key,
    required this.name,
    required this.data,
  });

  final String name;
  final List<GlucoseEventRecord> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(PatientDetailRoute());
      },
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
