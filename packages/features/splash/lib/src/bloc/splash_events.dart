part of 'splash_bloc.dart';

abstract class SplashEvent {
  const SplashEvent();
}

class StartLoading extends SplashEvent {
  const StartLoading();
}
