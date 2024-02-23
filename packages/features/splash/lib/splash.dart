library splash;

import 'package:navigation/navigation.dart';

import 'splash.gm.dart';

export 'splash.gm.dart';
export 'src/screen/splash_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class SplashModule extends $SplashModule {}
