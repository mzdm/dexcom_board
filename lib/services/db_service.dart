import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dexcom_board/services/models/glucose_event_records_dao.dart';
import 'package:dexcom_board/services/models/station_dao.dart';
import 'package:dexcom_board/services/save_directories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_test/encrypt_codec.dart';
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
      final secureStorage = const FlutterSecureStorage();
      final String dbPass;
      final dbStoredPass = await secureStorage.read(key: 'dbPassword');
      if (dbStoredPass == null) {
        debugPrint('No db password found, creating a new one');
        final r = Random.secure();
        final values = List<int>.generate(32, (i) => r.nextInt(256));
        dbPass = base64UrlEncode(values);
        await secureStorage.write(key: 'dbPassword', value: dbPass);
      } else {
        debugPrint('DEBUG_LOG: Found db password');
        dbPass = dbStoredPass;
      }
      database = await databaseFactoryIo.openDatabase(
        join(_saveDirectories.dbDirPath, _dbFileName),
        version: 1,
        codec: getEncryptSembastCodec(password: dbPass),
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
