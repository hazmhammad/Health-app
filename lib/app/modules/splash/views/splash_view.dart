import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/constants/style.dart';
import 'package:whole/constants/whole_icons_icons.dart';

import '../../../../preferences/user_preferences.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    print(UserPreferences().isLoggedIn );
    print(UserPreferences().firstVist );

    if(!UserPreferences().firstVist){
      Future.delayed(Duration(seconds: 1), (){
        Get.offNamedUntil(Routes.ONBOARDING, (route) => true);
      });
    }
   else if(!UserPreferences().firstVist && UserPreferences().isLoggedIn){
      Future.delayed(Duration(seconds: 1), (){
        Get.offNamedUntil(Routes.HOME, (route) => true);
      });
    }else if(!UserPreferences().firstVist && !UserPreferences().isLoggedIn){
      Future.delayed(Duration(seconds: 1), (){
        Get.offNamedUntil(Routes.LANDING, (route) => true);
      });
    }else{
      Future.delayed(Duration(seconds: 1), (){
        Get.offNamedUntil(Routes.LANDING, (route) => true);
    });
          }
    // Timer(Duration(seconds: 5), () => Get.offNamed(Routes.LANDING));
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      iBgImage,
                      fit: BoxFit.cover,
                    ))),
            Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Whole_icons.whole,
                        size: 180,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Icon(
                        Whole_icons.whole_text,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Icon(
                        Whole_icons.body__mind__spirit,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
