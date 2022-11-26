import 'dart:async';

import 'package:dexcom_board/services/active_user_dex_clients.dart';
import 'package:dexcom_board/services/models/app_models.dart';
import 'package:dexcom_board/services/models/glucose_event_records_dao.dart';
import 'package:dexcom_board/services/models/station_dao.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:dexcom_share_api/dexcom_share_api.dart';
import 'package:dio/src/dio_error.dart';
import 'package:either_dart/src/either.dart';
import 'package:flutter/material.dart';

const refreshInterval = 300;

class TimeRefreshService {
  TimeRefreshService({
    required this.activeUserDexClients,
  }) {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async {
      if (t.tick % refreshInterval == 0) {
        await onRefresh();
      }
    });
  }

  late final Timer timer;

  final ActiveUserDexClients activeUserDexClients;

  StationModelDao get stationModelDao => locator.get<StationModelDao>();

  GlucoseEventRecordsDao get glucoseEventRecordsDao => locator.get<GlucoseEventRecordsDao>();

  String get formatedTimeToRefresh {
    //get number of seconds to refresh
    final duration = Duration(seconds: refreshInterval - timer.tick % refreshInterval);

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  Future<void> onRefresh() async {
    print('DEBUG_LOG: Should refresh data');
    final allStations = await stationModelDao.getAllStations();
    // return; // temporary disabled to not refresh data for now
    for (final entryStation in allStations.entries) {
      print('DEBUG_LOG: Refreshing station ${entryStation.key}');
      await refreshData(entryStation.key, entryStation.value);
    }
  }

  Future<List<GlucoseEventRecord>> refreshData(String stationId, StationModel station) async {
    DexcomUserApi? getDexClient() => activeUserDexClients.getDexClient(stationId);
    if (getDexClient() == null) {
      final client = DexcomUserApi();
      final state = await client.init(username: station.username, password: station.password);
      if (state.isLeft) {
        throw Exception('DEBUG_LOG: Failed to login: ${state.left}');
      } else {
        debugPrint('DEBUG_LOG: Successfully re-logged in');
      }
      activeUserDexClients.addStation(stationId, client);
    }

    Either<DioError, List<GlucoseEventRecord>>? save =
        await getDexClient()?.getGlucoseEventRecords(minutes: 300);
    if (save == null || save.isLeft) {
      debugPrint('DEBUG_LOG: Failed to fetch latest glucose data: ${save?.left}');
      debugPrint('DEBUG_LOG: Trying to re-login');
      final client = DexcomUserApi();
      final state = await client.init(username: station.username, password: station.password);
      if (state.isLeft) {
        throw Exception('DEBUG_LOG: Failed to login: ${state.left}');
      } else {
        debugPrint('DEBUG_LOG: Successfully re-logged in');
      }
      save = await getDexClient()?.getGlucoseEventRecords(minutes: 300);
    }
    final fetchedData = save?.isRight == true ? save!.right : <GlucoseEventRecord>[];
    await glucoseEventRecordsDao.saveGlucoseListEventRecords(stationId, fetchedData);
    return fetchedData;
  }
}
