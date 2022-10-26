import 'package:get/get.dart';

class ChronicMedicationController extends GetxController {
  var medicationList = [
    {'id': 1, 'name': 'Foratec HFA 120', 'dosage': '12', 'unit': 'mcg'},
    {'id': 2, 'name': 'Lisoretic', 'dosage': '12.5', 'unit': 'mg'},
    {'id': 2, 'name': 'pdra - cartridgel', 'dosage': '3', 'unit': 'ml'},
  ];
  final count = 0.obs;
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
