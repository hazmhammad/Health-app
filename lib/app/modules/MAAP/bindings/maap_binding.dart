import 'package:get/get.dart';
import 'package:whole/app/modules/MAAP/controllers/maap_introduction_controller.dart';
import 'package:whole/app/modules/MAAP/controllers/maap_result_controller.dart';

import '../controllers/maap_controller.dart';

class MaapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaapController>(
      () => MaapController(),
    );
    Get.lazyPut<MaapIntroductionController>(
      () => MaapIntroductionController(),
    );
    Get.lazyPut<MaapResultController>(
      () => MaapResultController(),
    );
  }
}
