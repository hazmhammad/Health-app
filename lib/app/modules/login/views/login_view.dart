import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/modules/register/controllers/register_controller.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/constants/whole_icons_icons.dart';

import '../../../../constants/style.dart';
import '../../../widgets/widgets.dart';
import '../controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<LoginController>(
      init: controller,
      builder: (controller){
        return WholeAppScaffold(
            hasAppBar: false,
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Form(
                key: controller.loginFormKey,
                child: ConstrainedBox(
                  constraints:
                  BoxConstraints(minWidth: width, minHeight: height - 50),
                  child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                //title
                                Image.asset(
                                  iWhole,
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Login with',
                                  style: boldTextStyle(20),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                //social media
                                wholeAppSocialMediaButtons(),
                                //divider
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Divider(
                                          color: Colors.white,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'or',
                                      style: regularTextStyle(14),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: 20,
                                        ),
                                        child: Divider(
                                          color: Colors.white,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(30),
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Email address',
                                    style: regularTextStyle(14),
                                  ),
                                ),
                                SizedBox(height: 10),
                                BuildEmailTextField(controller: controller.emailController,),
                                SizedBox(height: 30),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Password',
                                    style: regularTextStyle(14),
                                  ),
                                ),
                                SizedBox(height: 10),
                                BuildPasswordTextField(
                                  controller: controller.passwordController,
                                  VisibilityIcon: controller.visibilityIcon,
                                  errorColor: controller.errorColor,
                                  isPasswordHidden: controller.isPasswordHidden,
                                  showPassword: controller.showPassword,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Password is required";
                                    }
                                    // return ''; this is causing you the error you must return null
                                    return null; // this is correct
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: EdgeInsets.all(30),
                            child: WholeAppButton(
                                text: 'login'.toUpperCase(),
                                onPressed: () {
                                  controller.checkLoginForm();
                                }),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'New user?',
                              style: regularTextStyle(16),
                            ),
                          ),
                          TextButton(
                              style: TextButton.styleFrom(primary: Colors.white),
                              onPressed: () {
                                Get.offAndToNamed(Routes.REGISTER);
                              },
                              child: Text('Register a new profile in a heartbeat',
                                  style: underlineRegularTextStyle(16))),
                          TextButton(
                              style: TextButton.styleFrom(primary: Colors.white),
                              onPressed: () {
                                Get.offAndToNamed(Routes.PASSWORD_RESET);
                              },
                              child: Text('Forgot password',
                                  style: underlineRegularTextStyle(16)))
                        ],
                      )),
                ),
              ),
            ));
      },
    );
  }
}
