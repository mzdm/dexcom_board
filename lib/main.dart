import 'package:dexcom_board/app.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await setup();
  runApp(const App());
}
