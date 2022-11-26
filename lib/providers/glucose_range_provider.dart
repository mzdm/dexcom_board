import 'package:dexcom_board/common.dart';

enum GlucoseRangeFilter {
  threeHours,
  oneHour,
  thirtyMinutes;

  String getLabel() {
    switch (this) {
      case GlucoseRangeFilter.threeHours:
        return '3h';
      case GlucoseRangeFilter.oneHour:
        return '1h';
      case GlucoseRangeFilter.thirtyMinutes:
        return '30m';
    }
  }

  int getShiftInMinutes() {
    switch (this) {
      case GlucoseRangeFilter.threeHours:
        return 180;
      case GlucoseRangeFilter.oneHour:
        return 60;
      case GlucoseRangeFilter.thirtyMinutes:
        return 30;
    }
  }

  bool minutesRemainderBottomLabel(DateTime value) {
    switch (this) {
      case GlucoseRangeFilter.threeHours:
        return value.minute % 30 == 0;
      case GlucoseRangeFilter.oneHour:
        return value.minute % 10 == 0;
      case GlucoseRangeFilter.thirtyMinutes:
        return value.minute % 5 == 0;
    }
  }
}

class GlucoseRangeProvider extends ChangeNotifier {
  GlucoseRangeProvider() : currFilter = GlucoseRangeFilter.threeHours;

  GlucoseRangeFilter currFilter;

  void changeFilter(GlucoseRangeFilter filter) {
    if (filter != currFilter) {
      currFilter = filter;
      notifyListeners();
    }
  }

  bool isSelected(GlucoseRangeFilter filter) {
    return filter == currFilter;
  }
}
