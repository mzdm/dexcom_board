import 'dart:async';

import 'package:dexcom_board/services/active_user_dex_clients.dart';
import 'package:rxdart/rxdart.dart';

class TimeRefreshService {
  TimeRefreshService({
    required this.activeUserDexClients,
  }) {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) async {
      if (t.tick % 5 == 0) {
        await onRefresh();
      }
      _actualDateTimeStreamController.add(DateTime.now());
    });
  }

  final refreshInterval = 180;
  late final Timer timer;

  final ActiveUserDexClients activeUserDexClients;

  String get formatedTimeToRefresh {
    //get number of seconds to refresh
    final duration =
        Duration(seconds: refreshInterval - timer.tick % refreshInterval);

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  final StreamController<DateTime> _actualDateTimeStreamController =
      StreamController.broadcast();

  Future<void> onRefresh() async {
    print('refresh');
  }

  Stream<DateTime> get actualDateTimeStream =>
      _actualDateTimeStreamController.stream.startWith(DateTime.now());
}
