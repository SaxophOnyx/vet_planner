library settings;

import 'package:navigation/navigation.dart';

import 'settings.gm.dart';

export 'settings.gm.dart';
export 'src/screen/settings_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class SettingsModule extends $SettingsModule {}
