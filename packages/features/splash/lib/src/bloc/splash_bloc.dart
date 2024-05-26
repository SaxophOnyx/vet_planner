import 'dart:async';

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:home/home.dart';
import 'package:navigation/navigation.dart';

part 'splash_events.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRouter _appRouter;

  SplashBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(const SplashState.initial()) {
    on<StartLoading>(_onStartLoading);
  }

  Future<void> _onStartLoading(
    StartLoading event,
    Emitter<SplashState> emit,
  ) async {
    await Future<void>.delayed(const Duration(milliseconds: AppConstants.MIN_SPLASH_DURATION_MS));
    unawaited(_appRouter.replace(const HomeRoute()));
  }
}
