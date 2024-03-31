import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../navigation.dart';

abstract class RouteBuilder {
  static Route<T> screen<T>(
    _,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return PageRouteBuilder<T>(
      settings: page,
      barrierColor: Colors.transparent,
      barrierDismissible: true,
      opaque: false,
      fullscreenDialog: true,
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      transitionDuration: AppDimens.DEFAULT_ANIMATION_DURATION,
      reverseTransitionDuration: AppDimens.DEFAULT_ANIMATION_DURATION,
    );
  }
}
