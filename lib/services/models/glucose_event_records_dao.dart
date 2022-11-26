import 'package:dexcom_board/services/db_service.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:dexcom_share_api/dexcom_share_api.dart';
import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';

class GlucoseEventRecordsDao {
  GlucoseEventRecordsDao({
    required DatabaseService dbService,
  })  : _dbService = dbService,
        store = stringMapStoreFactory.store(_storeKeyName);

  Future<GlucoseEventRecordsDao> init() async {
    locator.registerSingleton<GlucoseEventRecordsDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, Object?>> store;

  Database get db => _dbService.database;

  static const _storeKeyName = 'glucose_event_records';

  Future<void> saveGlucoseListEventRecords(
    String id,
    List<GlucoseEventRecord> glucoseListEventRecords,
  ) async {
    try {
      final json = GlucoseListEventRecords(eventRecords: glucoseListEventRecords).toJson();
      await store.record(id).put(db, json);
    } catch (e) {
      print('failed $e');
    }
  }

  Stream<GlucoseListEventRecords> getAllGlucoseListEventRecordsStream(String id) =>
      store.query(finder: Finder(filter: Filter.byKey(id))).onSnapshot(db).map((snapshot) {
        const empty = GlucoseListEventRecords(eventRecords: []);
        final json = snapshot?.value;
        if (json == null) return empty;
        try {
          return GlucoseListEventRecords.fromJson(json);
        } catch (e) {
          debugPrint('GlucoseEventRecordsDao: Error parsing json: $e');
          return empty;
        }
      });

  Future<void> clear() async {
    await store.drop(db);
  }
}
