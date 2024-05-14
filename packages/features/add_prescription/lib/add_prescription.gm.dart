// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:add_prescription/src/add_fixed/screen/add_fixed_entry_screen.dart'
    as _i1;
import 'package:add_prescription/src/add_periodic/screen/add_periodic_entry_screen.dart'
    as _i2;
import 'package:add_prescription/src/add_prescription/screen/add_prescription_screen.dart'
    as _i3;
import 'package:add_prescription/src/choose_type/screen/choose_prescription_type_screen.dart'
    as _i4;
import 'package:add_prescription/src/shared/models/fixed_prescription_entry.dart'
    as _i6;
import 'package:add_prescription/src/shared/models/prescription_entry_type.dart'
    as _i7;
import 'package:auto_route/auto_route.dart' as _i5;

abstract class $AddPrescriptionModule extends _i5.AutoRouterModule {
  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AddFixedEntryRoute.name: (routeData) {
      return _i5.AutoRoutePage<_i6.FixedPrescriptionEntry>(
        routeData: routeData,
        child: const _i1.AddFixedEntryScreen(),
      );
    },
    AddPeriodicEntryRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddPeriodicEntryScreen(),
      );
    },
    AddPrescriptionRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AddPrescriptionScreen(),
      );
    },
    ChoosePrescriptionTypeRoute.name: (routeData) {
      return _i5.AutoRoutePage<_i7.PrescriptionEntryType>(
        routeData: routeData,
        child: const _i4.ChoosePrescriptionTypeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddFixedEntryScreen]
class AddFixedEntryRoute extends _i5.PageRouteInfo<void> {
  const AddFixedEntryRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddFixedEntryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddFixedEntryRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddPeriodicEntryScreen]
class AddPeriodicEntryRoute extends _i5.PageRouteInfo<void> {
  const AddPeriodicEntryRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddPeriodicEntryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPeriodicEntryRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddPrescriptionScreen]
class AddPrescriptionRoute extends _i5.PageRouteInfo<void> {
  const AddPrescriptionRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddPrescriptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPrescriptionRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChoosePrescriptionTypeScreen]
class ChoosePrescriptionTypeRoute extends _i5.PageRouteInfo<void> {
  const ChoosePrescriptionTypeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ChoosePrescriptionTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChoosePrescriptionTypeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
