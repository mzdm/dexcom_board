import 'dart:async';

import 'package:dexcom_board/services/models/glucose_event_records_dao.dart';
import 'package:dexcom_board/services/models/station_dao.dart';
import 'package:dexcom_board/services/save_directories.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class DatabaseService {
  DatabaseService({
    required SaveDirectories saveDirectories,
  }) : _saveDirectories = saveDirectories;

  Future<void> init() async {
    mainStore = StoreRef.main();

    if (kIsWeb) {
      final factory = databaseFactoryWeb;
      database = await factory.openDatabase(_dbFileName, version: 1);
    } else {
      database =  await databaseFactoryIo.openDatabase(
        join(_saveDirectories.dbDirPath, _dbFileName),
        version: 1,
      );
    }

    await StationModelDao(dbService: this).init();
    await GlucoseEventRecordsDao(dbService: this).init();
  }

  final SaveDirectories _saveDirectories;

  late final Database database;

  late final StoreRef<String, Map<String, dynamic>> mainStore;

  static const _dbFileName = 'app.db';

  Future<void> clearAll() async {
    await mainStore.drop(database);
  }
}
