import 'package:dexcom_board/common.dart';

// green   3EF981   x >= 4 && x <= 10
// red     FB545D   x <= 3.9
// red     FB545D   x >= 14
// orange  E59E34   x >= 10.1 && x <= 13.9
Color getColorByGlucose(double? value) {
  if (value == null) return Colors.black;

  if (value >= 4 && value <= 10) {
    return Colors.green;
  } else if (value <= 3.9) {
    return Colors.red;
  } else if (value >= 14) {
    return Colors.red;
  } else if (value >= 10.1 && value <= 13.9) {
    return Colors.orange;
  }
  return Colors.black;
}

Color getBorderColorByGlucose(double? value) {
  if (value == null) return Colors.transparent;

  if (value >= 4 && value <= 10) {
    return Colors.transparent;
  } else if (value <= 3.9) {
    return Colors.red;
  } else if (value >= 14) {
    return Colors.red;
  } else if (value >= 10.1 && value <= 13.9) {
    return Colors.orange;
  }
  return Colors.transparent;
}
