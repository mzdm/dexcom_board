import 'package:dexcom_board/common.dart';
import 'package:dexcom_board/navigation/app_router.gr.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                //
                // final client = DexcomUserApi();
                // await client.init(username: 'ffd', password: 'fddf');
                context.pushRoute(const PatientDetailRoute());
              },
              child: Text('Glucose'),
            ),
          ],
        ),
      ),
    );
  }
}
