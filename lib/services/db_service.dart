import 'dart:async';

import 'package:dexcom_board/services/models/station_dao.dart';
import 'package:dexcom_board/services/save_directories.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseService {
  DatabaseService({
    required SaveDirectories saveDirectories,
  }) : _saveDirectories = saveDirectories;

  Future<void> init() async {
    mainStore = StoreRef.main();
    database = await databaseFactoryIo.openDatabase(
      join(_saveDirectories.dbDirPath, _dbFileName),
      version: 1,
    );
    await StationModelDao(dbService: this).init();
  }

  final SaveDirectories _saveDirectories;

  late final Database database;

  late final StoreRef<String, Map<String, dynamic>> mainStore;

  static const _dbFileName = 'app.db';

  Future<void> clearAll() async {
    await mainStore.drop(database);
  }
}
