import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:dexcom_board/navigation/app_router.gr.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/services/models/glucose_event_records_dao.dart';
import 'package:dexcom_board/ui/widgets/line_chart_widget.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return StreamBuilder<GlucoseListEventRecords>(
        stream: glucoseEventRecordsDao.getAllGlucoseListEventRecordsStream(stationId),
        builder: (context, snapshot) {
          final data = snapshot.data?.eventRecords;
          final latestValue = data?.firstOrNull;
          return InkWell(
            onTap: () {
              AutoRouter.of(context)
                  .push(PatientDetailRoute(stationId: stationId, station: station));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: latestValue?.isCritical == true ? Colors.redAccent : Colors.transparent,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).secondaryHeaderColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(station.stationName, style: TextStyle(color: Colors.black, fontSize: 20)),
                  IgnorePointer(
                    child: LineChartWidget(data: data, dotSize: 1, bottomLabelSize: 10),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest value from:\n${latestValue?.WT != null ? DateFormat('d. M. kk:mm').format(latestValue!.WT!) : ''}',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text.rich(
                          TextSpan(
                            text: '${latestValue?.glucoseValueEu ?? ''}',
                            style: TextStyle(
                              color:
                                  latestValue?.isCritical == true ? Colors.redAccent : Colors.black,
                              fontSize: 35,
                            ),
                            children: [
                              TextSpan(
                                text: ' mmol/L',
                                style: TextStyle(
                                  color: latestValue?.isCritical == true
                                      ? Colors.redAccent
                                      : Colors.black,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   '${latestValue?.glucoseValueEu ?? ''}',
                        //   style: TextStyle(
                        //     color:
                        //         latestValue?.isCritical == true ? Colors.redAccent : Colors.black,
                        //     fontSize: 35,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
