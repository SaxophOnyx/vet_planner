library prescriptions;

import 'package:navigation/navigation.dart';

import 'prescriptions.gm.dart';

export 'prescriptions.gm.dart';
export 'src/add_prescription/screen/add_prescription_screen.dart';
export 'src/add_prescription_entry/screen/add_prescription_entry_screen.dart';
export 'src/prescriptions/screen/prescriptions_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class PrescriptionsModule extends $PrescriptionsModule {}
