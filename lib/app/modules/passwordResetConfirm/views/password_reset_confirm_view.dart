import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/app/widgets/whole_app_scaffold.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/style.dart';

import '../controllers/password_reset_confirm_controller.dart';

class PasswordResetConfirmView extends GetView<PasswordResetConfirmController> {


 final String email, message;

  PasswordResetConfirmView({required this.email, required this.message});



  @override
  Widget build(BuildContext context) {
    return WholeAppScaffold(
        hasAppBar: false,
        body: Stack(children: [
          Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      iWhole,
                      height: 70,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Reset your password',
                      style: boldTextStyle(24),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 104,
                      width: 104,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Icon(
                        Icons.check,
                        size: 80,
                        color: kMidGray,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Reset instructions have been sent to',
                      style: regularTextStyle(16, Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      email,
                      style: boldTextStyle(16, Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20,),
                    Text(
                     message,
                      style: regularTextStyle(14, Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ])),
          Positioned(
              bottom: 30,
              right: 30,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  WholeAppButton(
                      text: 'Log in'.toUpperCase(),
                      onPressed: () {
                        Get.toNamed(Routes.LOGIN);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  WholeAppOutlinedButton(
                      text: 'back'.toUpperCase(),
                      onPressed: () {
                        Get.back();
                      })
                ],
              ))
        ]));
  }
}
