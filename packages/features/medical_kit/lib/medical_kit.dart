library medical_kit;

import 'package:navigation/navigation.dart';

import 'medical_kit.gm.dart';

export 'medical_kit.gm.dart';
export 'src/add_medication/screen/add_medication_screen.dart';
export 'src/add_stored_medication/screen/add_stored_medication_screen.dart';
export 'src/medications/screen/medications_screen.dart';
export 'src/stored_medications/screen/stored_medications_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class MedicalKitModule extends $MedicalKitModule {}
