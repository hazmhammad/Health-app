import 'package:get/get.dart';

import '../controllers/add_edit_allergies_controller.dart';

class AddEditAllergiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditAllergiesController>(
      () => AddEditAllergiesController(),
    );
  }
}
