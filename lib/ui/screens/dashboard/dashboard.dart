import 'package:dexcom_board/common.dart';
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
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: GridView.count(
          // shrinkWrap: true,
          primary: false,
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            ...List.generate(
              10,
              (index) => StationTile(
                name: 'Station $index',
                data: [],
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
}
