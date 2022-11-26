import 'package:dexcom_board/common.dart';
import 'package:dexcom_board/providers/glucose_range_provider.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/services/time_refresh_service.dart';
import 'package:dexcom_board/ui/widgets/add_station_dialog.dart';
import 'package:dexcom_board/ui/widgets/station_tile.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_builder/timer_builder.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with AddStationDialog {
  final TextEditingController stationNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  TimeRefreshService get timeRefreshService =>
      locator.get<TimeRefreshService>();

  late final GlucoseRangeProvider glucoseRangeProvider;

  @override
  void initState() {
    super.initState();
    glucoseRangeProvider = context.read<GlucoseRangeProvider>();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final children2 = [
      Consumer<GlucoseRangeProvider>(
        builder: (_, data, __) {
          return SeparatedRow(
            separatorBuilder: () => const SizedBox(width: 4.0),
            children: [
              _buildTextButton(context, GlucoseRangeFilter.threeHours),
              _buildTextButton(context, GlucoseRangeFilter.oneHour),
              _buildTextButton(context, GlucoseRangeFilter.thirtyMinutes),
            ],
          );
        },
      ),
      TimerBuilder.periodic(
        const Duration(seconds: 1),
        builder: (context) {
          return Text(
            'Next data update: ${timeRefreshService.formatedTimeToRefresh}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          );
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dexcom Board'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (size.width > 600)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children2,
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children2,
              ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<Map<String, StationModel>>(
                stream: stationModelDao.stationsStream,
                builder: (context, snapshot) {
                  final stations = snapshot.data;
                  if (stations == null) return const SizedBox.shrink();
                  return GridView.count(
                    primary: false,
                    crossAxisCount: getCrossAxisCount(context),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                    children: stations.entries
                        .map(
                          (entry) => StationTile(
                            stationId: entry.key,
                            station: entry.value,
                          ),
                        )
                        .toList(),
                    // children: [
                    //   ...List.generate(
                    //     10,
                    //     (index) => const StationTile(
                    //       stationId: 'entry.key',
                    //       station: StationModel(
                    //         stationName: 'Station name',
                    //         username: '',
                    //         password: '',
                    //       ),
                    //     ),
                    //   ),
                    // ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await displayStationDialog(
            context,
            stationNameController: stationNameController,
            usernameController: usernameController,
            passwordController: passwordController,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTextButton(
      BuildContext context, GlucoseRangeFilter glucoseRangeFilter) {
    const selectedTextStyle = TextStyle(color: Colors.white);
    return TextButton(
      onPressed: () {
        glucoseRangeProvider.changeFilter(glucoseRangeFilter);
      },
      style: TextButton.styleFrom(
        backgroundColor: glucoseRangeProvider.isSelected(glucoseRangeFilter)
            ? Theme.of(context).primaryColor
            : null,
      ),
      child: Text(
        glucoseRangeFilter.getLabel(),
        style: glucoseRangeProvider.isSelected(glucoseRangeFilter)
            ? selectedTextStyle
            : null,
      ),
    );
  }

  int getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width > 1450) {
      return 4;
    } else if (width > 1100) {
      return 3;
    } else if (width > 600) {
      return 2;
    } else {
      return 1;
    }
  }
}
