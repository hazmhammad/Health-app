import 'package:get/get.dart';

import 'package:whole/app/modules/bmi/controllers/assessment_controller.dart';

import '../controllers/bmi_controller.dart';

class BmiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssessmentController>(
      () => AssessmentController(),
    );
    Get.lazyPut<BmiController>(
      () => BmiController(),
    );
  }
}
