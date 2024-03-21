library medical_kit;

import 'package:navigation/navigation.dart';

import 'medical_kit.gm.dart';

export 'medical_kit.gm.dart';
export 'src/add_medication_type/screen/add_medication_type_screen.dart';
export 'src/medical_kit/screen/medical_kit_screen.dart';
export 'src/stored_medications/screen/stored_medications_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen|Dialog,Route')
class MedicalKitModule extends $MedicalKitModule {}
