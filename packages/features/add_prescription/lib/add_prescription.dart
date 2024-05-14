library add_prescription;

import 'package:navigation/navigation.dart';

import 'add_prescription.gm.dart';

export 'add_prescription.gm.dart';
export 'src/add_fixed/screen/add_fixed_entry_screen.dart';
export 'src/add_periodic/screen/add_periodic_entry_screen.dart';
export 'src/add_prescription/screen/add_prescription_screen.dart';
export 'src/choose_type/screen/choose_prescription_type_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class AddPrescriptionModule extends $AddPrescriptionModule {}
