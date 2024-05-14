library prescriptions;

import 'package:navigation/navigation.dart';

import 'prescriptions.gm.dart';

export 'prescriptions.gm.dart';
export 'src/prescriptions/screen/prescriptions_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class PrescriptionsModule extends $PrescriptionsModule {}
