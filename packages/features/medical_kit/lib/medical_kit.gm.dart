// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:domain/domain.dart' as _i5;
import 'package:medical_kit/src/add_medication_type/screen/add_medication_type_screen.dart'
    as _i1;
import 'package:medical_kit/src/medical_kit/screen/medical_kit_screen.dart'
    as _i2;
import 'package:medical_kit/src/stored_medications/screen/stored_medications_screen.dart'
    as _i3;

abstract class $MedicalKitModule extends _i4.AutoRouterModule {
  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AddMedicationTypeRoute.name: (routeData) {
      return _i4.AutoRoutePage<_i5.MedicationType>(
        routeData: routeData,
        child: const _i1.AddMedicationTypeScreen(),
      );
    },
    MedicalKitRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MedicalKitScreen(),
      );
    },
    StoredMedicationsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.StoredMedicationsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddMedicationTypeScreen]
class AddMedicationTypeRoute extends _i4.PageRouteInfo<void> {
  const AddMedicationTypeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          AddMedicationTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMedicationTypeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MedicalKitScreen]
class MedicalKitRoute extends _i4.PageRouteInfo<void> {
  const MedicalKitRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MedicalKitRoute.name,
          initialChildren: children,
        );

  static const String name = 'MedicalKitRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StoredMedicationsScreen]
class StoredMedicationsRoute extends _i4.PageRouteInfo<void> {
  const StoredMedicationsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          StoredMedicationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoredMedicationsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
