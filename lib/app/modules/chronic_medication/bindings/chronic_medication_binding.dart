import 'package:get/get.dart';

import '../controllers/chronic_medication_controller.dart';

class ChronicMedicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChronicMedicationController>(
      () => ChronicMedicationController(),
    );
  }
}
