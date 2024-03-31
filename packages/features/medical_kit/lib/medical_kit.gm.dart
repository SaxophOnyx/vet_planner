// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:domain/domain.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:medical_kit/src/add_medication_type/screen/add_medication_type_screen.dart'
    as _i1;
import 'package:medical_kit/src/add_stored_medication/screen/add_stored_medication_screen.dart'
    as _i2;
import 'package:medical_kit/src/medical_kit/screen/medical_kit_screen.dart'
    as _i3;
import 'package:medical_kit/src/stored_medications/screen/stored_medications_screen.dart'
    as _i4;

abstract class $MedicalKitModule extends _i5.AutoRouterModule {
  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AddMedicationTypeRoute.name: (routeData) {
      return _i5.AutoRoutePage<_i6.MedicationType>(
        routeData: routeData,
        child: const _i1.AddMedicationTypeScreen(),
      );
    },
    AddStoredMedicationRoute.name: (routeData) {
      final args = routeData.argsAs<AddStoredMedicationRouteArgs>();
      return _i5.AutoRoutePage<_i6.StoredMedication>(
        routeData: routeData,
        child: _i2.AddStoredMedicationScreen(
          key: args.key,
          medicationType: args.medicationType,
        ),
      );
    },
    MedicalKitRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MedicalKitScreen(),
      );
    },
    StoredMedicationsRoute.name: (routeData) {
      final args = routeData.argsAs<StoredMedicationsRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.StoredMedicationsScreen(
          key: args.key,
          medicationType: args.medicationType,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddMedicationTypeScreen]
class AddMedicationTypeRoute extends _i5.PageRouteInfo<void> {
  const AddMedicationTypeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddMedicationTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMedicationTypeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddStoredMedicationScreen]
class AddStoredMedicationRoute
    extends _i5.PageRouteInfo<AddStoredMedicationRouteArgs> {
  AddStoredMedicationRoute({
    _i7.Key? key,
    required _i6.MedicationType medicationType,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AddStoredMedicationRoute.name,
          args: AddStoredMedicationRouteArgs(
            key: key,
            medicationType: medicationType,
          ),
          initialChildren: children,
        );

  static const String name = 'AddStoredMedicationRoute';

  static const _i5.PageInfo<AddStoredMedicationRouteArgs> page =
      _i5.PageInfo<AddStoredMedicationRouteArgs>(name);
}

class AddStoredMedicationRouteArgs {
  const AddStoredMedicationRouteArgs({
    this.key,
    required this.medicationType,
  });

  final _i7.Key? key;

  final _i6.MedicationType medicationType;

  @override
  String toString() {
    return 'AddStoredMedicationRouteArgs{key: $key, medicationType: $medicationType}';
  }
}

/// generated route for
/// [_i3.MedicalKitScreen]
class MedicalKitRoute extends _i5.PageRouteInfo<void> {
  const MedicalKitRoute({List<_i5.PageRouteInfo>? children})
      : super(
          MedicalKitRoute.name,
          initialChildren: children,
        );

  static const String name = 'MedicalKitRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.StoredMedicationsScreen]
class StoredMedicationsRoute
    extends _i5.PageRouteInfo<StoredMedicationsRouteArgs> {
  StoredMedicationsRoute({
    _i7.Key? key,
    required _i6.MedicationType medicationType,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          StoredMedicationsRoute.name,
          args: StoredMedicationsRouteArgs(
            key: key,
            medicationType: medicationType,
          ),
          initialChildren: children,
        );

  static const String name = 'StoredMedicationsRoute';

  static const _i5.PageInfo<StoredMedicationsRouteArgs> page =
      _i5.PageInfo<StoredMedicationsRouteArgs>(name);
}

class StoredMedicationsRouteArgs {
  const StoredMedicationsRouteArgs({
    this.key,
    required this.medicationType,
  });

  final _i7.Key? key;

  final _i6.MedicationType medicationType;

  @override
  String toString() {
    return 'StoredMedicationsRouteArgs{key: $key, medicationType: $medicationType}';
  }
}
