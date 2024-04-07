// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:prescriptions/src/add_prescription/screen/add_prescription_screen.dart'
    as _i2;
import 'package:prescriptions/src/add_prescription_entry/screen/add_prescription_entry_screen.dart'
    as _i1;
import 'package:prescriptions/src/prescriptions/screen/prescriptions_screen.dart'
    as _i3;

abstract class $PrescriptionsModule extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AddPrescriptionEntryRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddPrescriptionEntryScreen(),
      );
    },
    AddPrescriptionRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddPrescriptionScreen(),
      );
    },
    PrescriptionsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PrescriptionsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddPrescriptionEntryScreen]
class AddPrescriptionEntryRoute extends _i4.PageRouteInfo<void> {
  const AddPrescriptionEntryRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AddPrescriptionEntryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPrescriptionEntryRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddPrescriptionScreen]
class AddPrescriptionRoute extends _i4.PageRouteInfo<void> {
  const AddPrescriptionRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AddPrescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPrescriptionRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PrescriptionsScreen]
class PrescriptionsRoute extends _i4.PageRouteInfo<void> {
  const PrescriptionsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          PrescriptionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrescriptionsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
