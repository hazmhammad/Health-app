import 'package:get/get.dart';

class ChronicAssessmentController extends GetxController {
  //TODO: Implement ChronicAssessmentController

  final count = 0.obs;
  final int numMax = 0;
  var defaultCholesterol = 5.8.obs;
  var defaultGlucose = 6.obs;
  var defaultDiastole = 120.obs;
  var defaultSystole = 80.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
