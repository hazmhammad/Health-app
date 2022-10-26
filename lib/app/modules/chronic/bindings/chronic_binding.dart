import 'package:get/get.dart';
import 'package:whole/app/modules/chronic/controllers/chronic_assessment_controller.dart';

import '../controllers/chronic_controller.dart';

class ChronicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChronicAssessmentController>(
      () => ChronicAssessmentController(),
    );
    Get.lazyPut<ChronicController>(
      () => ChronicController(),
    );
  }
}
