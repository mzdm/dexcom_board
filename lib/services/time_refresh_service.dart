import 'dart:async';

import 'package:dexcom_board/services/active_user_dex_clients.dart';
import 'package:rxdart/rxdart.dart';

const _refreshInterval = Duration(seconds: 1);

class TimeRefreshService {
  TimeRefreshService({
    required this.activeUserDexClients,
  }) {
    timer = Timer.periodic(_refreshInterval, (Timer t) async {
      if (t.tick % 5 == 0) {
        await onRefresh();
      }
      _actualDateTimeStreamController.add(DateTime.now());
    });
  }

  late final Timer timer;

  final ActiveUserDexClients activeUserDexClients;

  final StreamController<DateTime> _actualDateTimeStreamController = StreamController.broadcast();

  Future<void> onRefresh() async {
    print('refresh');
  }

  Stream<DateTime> get actualDateTimeStream =>
      _actualDateTimeStreamController.stream.startWith(DateTime.now());
}
