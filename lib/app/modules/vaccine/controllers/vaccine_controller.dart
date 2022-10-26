import 'package:get/get.dart';

class VaccineController extends GetxController {
  var immunizationsCount = 3;

  var immunizations = [
    {'id': '1', 'name': 'Hepatitis A', 'type': 'Travel'},
    {'id': '2', 'name': 'Hepatitis B', 'type': 'Travel'},
    {'id': '3', 'name': 'Meningitis', 'type': 'Routine'},
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
