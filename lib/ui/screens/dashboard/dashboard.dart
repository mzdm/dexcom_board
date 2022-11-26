import 'package:dexcom_board/common.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/ui/widgets/add_station_dialog.dart';
import 'package:dexcom_board/ui/widgets/station_tile.dart';
import 'package:flutter/material.dart';

const apiKey = String.fromEnvironment('FHIR_API_KEY');

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> with AddStationDialog {
  final TextEditingController stationNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dexcom Board'),
      ),
      body: StreamBuilder<Map<String, StationModel>>(
        stream: stationModelDao.stationsStream,
        builder: (context, snapshot) {
          final stations = snapshot.data;
          if (stations == null) return const SizedBox.shrink();
          return GridView.count(
            primary: false,
            crossAxisCount: 4,
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
            //     (index) => StationTile(
            //       name: 'Station $index',
            //       data: [],
            //     ),
            //   ),
            // ],
          );
        },
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
}
