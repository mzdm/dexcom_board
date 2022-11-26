import 'package:dexcom_board/services/db_service.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:sembast/sembast.dart';

class StationModelDao {
  StationModelDao({
    required DatabaseService dbService,
  })  : _dbService = dbService,
        _store = stringMapStoreFactory.store(_storeKeyName);

  Future<StationModelDao> init() async {
    locator.registerSingleton<StationModelDao>(this);
    return this;
  }

  final DatabaseService _dbService;
  final StoreRef<String, Map<String, Object?>> _store;

  Database get _db => _dbService.database;

  static const _storeKeyName = 'station_models';

  Future<String> saveStation(StationModel station) async {
    final json = station.toJson();
    return _store.add(_db, json);
  }

  Future<void> updateStation(String stationId, StationModel station) async {
    final json = station.toJson();
    await _store.record(stationId).put(_db, json);
  }

  Stream<List<StationModel>> get stationsStream => _store
      .query()
      .onSnapshots(_db)
      .map((snapshot) => snapshot.map((record) => StationModel.fromJson(record.value)).toList());

  Future<void> clear() async {
    await _store.drop(_db);
  }
}
