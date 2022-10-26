import 'package:get/get.dart';

class AllergiesController extends GetxController {
  var allergiesCount = 6;

  var allergies = [
    {'name': 'Shallfish', 'type': 'Food'},
    {'name': 'Wheat', 'type': 'Food'},
    {'name': 'Cat', 'type': 'Pet'},
    {'name': 'Soy', 'type': 'Food'},
    {'name': 'Eggs', 'type': 'Food'},
    {'name': 'Pollen', 'type': 'Environmental'},
  ];

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
}
