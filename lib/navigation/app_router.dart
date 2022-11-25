import 'package:auto_route/auto_route.dart';
import 'package:dexcom_board/ui/patient_detail/pacient_detail.dart';
import 'package:dexcom_board/ui/screens/dashboard/dashboard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: DashBoardScreen, initial: true),
    AutoRoute(page: PatientDetailScreen),
  ],
)
class $AppRouter {}
