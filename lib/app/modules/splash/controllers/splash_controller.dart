import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:whole/app/routes/app_pages.dart';

import '../../../../preferences/user_preferences.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
// print(UserPreferences().isLoggedIn );
//     String route = UserPreferences().isLoggedIn ? Routes.HOME  : Routes.LOGIN;
//     Future.delayed(Duration(seconds: 1), (){
//       Get.offNamedUntil(route, (route) => false);
//     });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
