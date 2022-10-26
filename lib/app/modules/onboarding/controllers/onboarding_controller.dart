import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whole/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController

  final count = 0.obs;

 static OnboardingController get to => Get.find();
  late PageController pageController;

  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);


  }

  @override
  void onInit() {
    super.onInit();
    pageController =  PageController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
