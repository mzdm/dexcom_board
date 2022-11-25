import 'package:dexcom_board/app/constants.dart';
import 'package:dexcom_board/ui/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Dexcom Board',
          theme: ThemeData(
            primarySwatch: AppColors.primarySwatch,
          ),
          home: const DashBoardScreen(),
        );
      },
    );
  }
}
