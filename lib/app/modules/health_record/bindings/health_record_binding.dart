import 'package:get/get.dart';

import '../controllers/health_record_controller.dart';

class HealthRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthRecordController>(
      () => HealthRecordController(),
    );
  }
}
