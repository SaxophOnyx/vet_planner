// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:domain/domain.dart' as _i5;
import 'package:flutter/material.dart' as _i4;
import 'package:prescriptions/src/details/screen/prescription_details_screen.dart' as _i1;
import 'package:prescriptions/src/prescriptions/screen/prescriptions_screen.dart' as _i2;

abstract class $PrescriptionsModule extends _i3.AutoRouterModule {
  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    PrescriptionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PrescriptionDetailsRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.PrescriptionDetailsScreen(
          key: args.key,
          entry: args.entry,
        ),
      );
    },
    PrescriptionsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PrescriptionsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.PrescriptionDetailsScreen]
class PrescriptionDetailsRoute extends _i3.PageRouteInfo<PrescriptionDetailsRouteArgs> {
  PrescriptionDetailsRoute({
    _i4.Key? key,
    required _i5.PrescriptionEntry entry,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          PrescriptionDetailsRoute.name,
          args: PrescriptionDetailsRouteArgs(
            key: key,
            entry: entry,
          ),
          initialChildren: children,
        );

  static const String name = 'PrescriptionDetailsRoute';

  static const _i3.PageInfo<PrescriptionDetailsRouteArgs> page =
      _i3.PageInfo<PrescriptionDetailsRouteArgs>(name);
}

class PrescriptionDetailsRouteArgs {
  const PrescriptionDetailsRouteArgs({
    this.key,
    required this.entry,
  });

  final _i4.Key? key;

  final _i5.PrescriptionEntry entry;

  @override
  String toString() {
    return 'PrescriptionDetailsRouteArgs{key: $key, entry: $entry}';
  }
}

/// generated route for
/// [_i2.PrescriptionsScreen]
class PrescriptionsRoute extends _i3.PageRouteInfo<void> {
  const PrescriptionsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          PrescriptionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrescriptionsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
