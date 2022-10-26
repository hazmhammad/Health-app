import 'package:get/get.dart';

class MaapResultController extends GetxController {
  //TODO: Implement BmiController
  var expanded = false;

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

  void expand() {
    expanded = !expanded;
    update();
  }
}
