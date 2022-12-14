import 'dart:async';

import 'package:dexcom_board/navigation/app_router.gr.dart';
import 'package:dexcom_board/services/active_user_dex_clients.dart';
import 'package:dexcom_board/services/db_service.dart';
import 'package:dexcom_board/services/save_directories.dart';
import 'package:dexcom_board/services/time_refresh_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  locator.registerSingleton<AppRouter>(AppRouter());

  locator.registerSingleton<ActiveUserDexClients>(ActiveUserDexClients());

  locator.registerSingleton<TimeRefreshService>(
    TimeRefreshService(activeUserDexClients: locator.get<ActiveUserDexClients>()),
  );

  locator.registerSingleton<SaveDirectories>(SaveDirectories());
  await locator.get<SaveDirectories>().init();
  locator.registerSingleton<DatabaseService>(
    DatabaseService(
      saveDirectories: locator.get<SaveDirectories>(),
    ),
  );
  await locator.get<DatabaseService>().init();
}
