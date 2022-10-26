import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/app/widgets/whole_app_name_textfield.dart';

import '../../../../constants/constants.dart';
import '../../../widgets/widgets.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color errorColor = kDangerRed;
    return GetBuilder<RegisterController>(
        init: controller,
        builder: (RegisterController controller) {
          return WholeAppScaffold(
              hasAppBar: false,
              body: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: Form(
                  key: controller.registerFormKey,
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: width, minHeight: height - 40),
                    child: IntrinsicHeight(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //title
                              Image.asset(
                                iWhole,
                                height: 50,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Register with',
                                style: boldTextStyle(20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //social media
                              wholeAppSocialMediaButtons(),

                              //divider
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(right: 20, top: 30),
                                      child: Divider(
                                        color: Colors.white,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Text(
                                      'or',
                                      style: regularTextStyle(14),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 30),
                                      child: Divider(
                                        color: Colors.white,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 0, left: 30, right: 30),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'First name',
                                  style: regularTextStyle(14),
                                ),
                              ),
                              SizedBox(height: 5),
                              BuildNameTextField(controller: controller.nameController,),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Email address',
                                  style: regularTextStyle(14),
                                ),
                              ),
                              SizedBox(height: 5),
                              BuildEmailTextField(
                                controller: controller.emailController,
                              ),
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Password',
                                  style: regularTextStyle(14),
                                ),
                              ),
                              SizedBox(height: 20),
                              BuildPasswordTextField(
                                controller: controller.passwordController,
                                VisibilityIcon: controller.visibilityIcon,
                                isPasswordHidden: controller.isPasswordHidden,
                                showPassword: controller.showPassword,
                                errorColor: controller.errorColor,
                                validator: (String? value) {
                                  RegExp numRegExp = RegExp(r".*[0-9].*");
                                  RegExp letterRegExp = RegExp(r".*[a-zA-Z].*");
                                  RegExp spicalChar = RegExp("[-!\$%^&*()_+|~=`{}\\[\\]:;'<>?,.\\/\"]");
                                  if (value!.isEmpty) {
                                    errorColor = kDangerRed;
                                    return
                                    'Please, type a password.Password can contain letters, numbers and punctuation.';
                                  } else if (value.length < 8 && !value.isEmpty) {
                                    errorColor = kOrange;
                                    return
                                    'Password Strength: Weak \n Use at least 8 characters. Password can contain letters, numbers and punctuation.';

                                  } else if (!letterRegExp.hasMatch(value) || !numRegExp.hasMatch(value) || !spicalChar.hasMatch(value)) {
                                    errorColor = kBlue;

                                   return
                                    'Password Strength: Fair \nUse at least 8 characters. Password can contain letters, numbers , symbols and punctuation.';
                                  } else {
                                    errorColor = kSafeGreen;
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 0, bottom: 0, left: 30, right: 30),
                          child: WholeAppButton(
                              text: 'Sign up'.toUpperCase(),
                              onPressed: () {
                        controller.checkRegisterForm();
                                // Get.toNamed(Routes.ONBOARDING);
                              }),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Existing user?',
                                style: regularTextStyle(16),
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      primary: Colors.white),
                                  onPressed: () {
                                    Get.offAndToNamed(Routes.LOGIN);
                                  },
                                  child: Text('Sign in now',
                                      style: underlineRegularTextStyle(16)))
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ));
        });
  }
}
