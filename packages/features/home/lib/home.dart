library home;

import 'package:navigation/navigation.dart';

import 'home.gm.dart';

export 'home.gm.dart';
export 'src/screen/home_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class HomeModule extends $HomeModule {}
