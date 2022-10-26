import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:whole/constants/style.dart';

import '../../../../preferences/user_preferences.dart';
import '../../../api/api_settings.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';
class RegisterController extends GetxController {
  //TODO: Implement RegisterController
static RegisterController get to => Get.find();

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
late TextEditingController emailController, passwordController, nameController;

  var isPasswordHidden = true;
  var errorColor = kDangerRed;

  var visibilityIcon = Icons.visibility_outlined;

  String errorMessage = "";

  String password = "";
  //var value = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }
  //void increment() => count.value++;

  void showPassword() {
    //isPasswordHidden = !isPasswordHidden;
    if (isPasswordHidden == true) {
      visibilityIcon = Icons.visibility_outlined;
      isPasswordHidden = false;
      update();
    } else {
      visibilityIcon = Icons.visibility_off_outlined;
      isPasswordHidden = true;
      update();
    }
  }

//it is not working because of function syntax
  String? passwordErrorMessage(String? value) {
    RegExp numRegExp = RegExp(r".*[0-9].*");
    RegExp letterRegExp = RegExp(r".*[a-zA-Z].*");
    if (value!.isEmpty) {
      errorColor = kDangerRed;
      errorMessage =
          'Please, type a password.Password can contain letters, numbers and punctuation.';
      update();
      return errorMessage;
    } else if (value.length < 8 && !value.isEmpty) {
      errorColor = kOrange;
      errorMessage =
          'Password Strength: Weak \n Use at least 8 characters. Password can contain letters, numbers and punctuation.';
      update();
      return errorMessage;
    } else if (!letterRegExp.hasMatch(value) || !numRegExp.hasMatch(value)) {
      errorColor = kBlue;

      errorMessage =
          'Password Strength: Fair \nUse at least 8 characters. Password can contain letters, numbers and punctuation.';
      update();
      return errorMessage;
    } else {
      errorColor = kSafeGreen;

      update();
      return null;
    }
    update();
  }


  bool checkRegisterForm(){
    final isValid = registerFormKey.currentState!.validate();
    print(isValid);
    if (!isValid) {
      return false;
    }else{
      registerFormKey.currentState!.save();
doRegister();
      return true;
    }

  }

  Future<bool> doRegister() async{

    var url = Uri.parse(ApiSettings.REGISTER_USER);

    var response = await http.post(url, body: {
      "name": nameController.text,
      "password": passwordController.text,
      "email" : emailController.text,
      "isAdmin": "false",
      "isPremium": "false",
      "isAuthor": "false"
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse  = response.body;

      print(response.statusCode);
      print(jsonResponse);
      Get.snackbar("Success", "Registered Successful",backgroundColor: Colors.green);
      Get.offNamedUntil(Routes.HOME, (route) => false);
      UserPreferences().saveToken(jsonResponse);

      return true;
    }
    Get.snackbar("Register filed", response.body,backgroundColor: Colors.red);

    return false;
  }

}
