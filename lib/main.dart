import 'package:dexcom_board/app/constants.dart';
import 'package:dexcom_board/ui/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dexcom Board',
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
      ),
      home: const DashBoardScreen(),
    );
  }
}
