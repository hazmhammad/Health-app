import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/modules/register/controllers/register_controller.dart';
import 'package:whole/app/modules/register/views/register_view.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/app/widgets/whole_app_button.dart';
import 'package:whole/app/widgets/whole_app_outlined_button.dart';
import '../controllers/landing_controller.dart';
import 'package:whole/constants/constants.dart';

class LandingView extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //background image
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Opacity(
                opacity: 0.7,
                child: Image.asset(
                  iBgImage,
                  fit: BoxFit.cover,
                ),
              )),
              //whole logo
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
                        //logo image
                        Icon(
                          Whole_icons.whole,
                          size: 180,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        //whole text
                        Icon(
                          Whole_icons.whole_text,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        //slogan text
                        Icon(
                          Whole_icons.body__mind__spirit,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    )),
              ),
              //bottom buttons
              Positioned(
                  bottom: 60,
                  left: 30,
                  right: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //register button
                      WholeAppButton(
                          text: 'register'.toUpperCase(),
                          onPressed: () {
                            Get.toNamed(Routes.REGISTER);
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      //Log in
                      WholeAppOutlinedButton(
                          text: 'log in'.toUpperCase(),
                          onPressed: () {
                            Get.toNamed(Routes.LOGIN);
                          }),
                    ],
                  ))
            ],
          )),
    );
  }
}
