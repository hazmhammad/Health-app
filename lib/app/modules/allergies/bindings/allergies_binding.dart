import 'package:get/get.dart';

import '../controllers/allergies_controller.dart';

class AllergiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllergiesController>(
      () => AllergiesController(),
    );
  }
}
