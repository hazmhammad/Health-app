import 'package:get/get.dart';

import 'package:whole/app/modules/profile/controllers/profile_edit_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditController>(
      () => ProfileEditController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
