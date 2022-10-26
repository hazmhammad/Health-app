import 'package:get/get.dart';

import '../controllers/manage_subscriptions_controller.dart';

class ManageSubscriptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageSubscriptionsController>(
      () => ManageSubscriptionsController(),
    );
  }
}
