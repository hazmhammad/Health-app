import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssessmentController extends GetxController {
  //TODO: Implement AssessmentController

  final count = 0.obs;
  final int numMax = 0;
  var defaultWeigh = 71.obs;
  var defaultHeight = 171.obs;
  var defaultWaist = 127.obs;
  var defaultEthnicity = 50.obs;

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
