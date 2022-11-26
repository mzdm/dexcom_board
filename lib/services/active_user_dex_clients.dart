import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_share_api/dexcom_share_api.dart';

class ActiveUserDexClients {
  // key is stationId
  final activeUserDexClients = <String, DexcomUserApi>{};

  bool containsStation(String stationId) {
    return activeUserDexClients.containsKey(stationId);
  }

  DexcomUserApi? getDexClient(String stationId) {
    return activeUserDexClients[stationId];
  }

  void addStation(String stationId, DexcomUserApi client) {
    activeUserDexClients[stationId] = client;
  }

  void removeStation(String stationId) {
    activeUserDexClients.remove(stationId);
  }
}
