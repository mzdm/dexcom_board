// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../ui/patient_detail/pacient_detail.dart' as _i2;
import '../ui/screens/dashboard/dashboard.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DashBoardRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DashBoardScreen(),
      );
    },
    PatientDetailRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.PatientDetailScreen(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          DashBoardRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          PatientDetailRoute.name,
          path: '/patient-detail-screen',
        ),
      ];
}

/// generated route for
/// [_i1.DashBoardScreen]
class DashBoardRoute extends _i3.PageRouteInfo<void> {
  const DashBoardRoute()
      : super(
          DashBoardRoute.name,
          path: '/',
        );

  static const String name = 'DashBoardRoute';
}

/// generated route for
/// [_i2.PatientDetailScreen]
class PatientDetailRoute extends _i3.PageRouteInfo<void> {
  const PatientDetailRoute()
      : super(
          PatientDetailRoute.name,
          path: '/patient-detail-screen',
        );

  static const String name = 'PatientDetailRoute';
}
