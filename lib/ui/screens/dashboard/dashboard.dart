import 'package:dexcom_board/common.dart';
import 'package:dexcom_board/navigation/app_router.gr.dart';
import 'package:dexcom_board/ui/widgets/station_tile.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

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
    );
  }
}
