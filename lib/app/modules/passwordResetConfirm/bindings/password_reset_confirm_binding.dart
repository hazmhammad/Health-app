import 'package:get/get.dart';

import '../controllers/password_reset_confirm_controller.dart';

class PasswordResetConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordResetConfirmController>(
      () => PasswordResetConfirmController(),
    );
  }
}
