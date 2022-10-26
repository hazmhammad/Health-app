import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/style.dart';
import '../../../../preferences/user_preferences.dart';
import '../../../api/api_settings.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  static LoginController get to => Get.find();
  var isPasswordHidden = true;
  var visibilityIcon = Icons.visibility_outlined;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  var errorColor = kDangerRed;

  RxString errorMessage = "".obs;
  String password = "";

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();

  }


  String? validateAllField(String value) {
    if (value.length == 0) {
      return "This filed should't blank";
    }
    return null;
  }

  void showPassword() {
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

  String? passwordErrorMessage(String? value) {

    RegExp numRegExp = RegExp(r".*[0-9].*");
    RegExp letterRegExp = RegExp(r".*[a-zA-Z].*");
    if (value!.isEmpty) {
      errorColor = kDangerRed;
      errorMessage.value =
      'Please, type a password.Password can contain letters, numbers and punctuation.';
      update();
      return errorMessage.value;
    }
      else {
      errorColor = kSafeGreen;

      // errorMessage.value =
      // 'Password Strength: Strong \n Use at least 8 characters. Password can contain letters, numbers and punctuation.';
  errorMessage.value = "";
      update();

      print(errorMessage);
      return null;
    }
    return null;
  }
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return "Password must be of 8 characters";
    }
    return null;
  }

  bool checkLoginForm() {
    final isValid = loginFormKey.currentState!.validate();
   print(isValid);
    if (!isValid) {
      print("not valid");
      return false;
    }else{
      loginFormKey.currentState!.save();
      doLogin();
      return true;
    }

    // saveToShared();
  }

  Future<bool>  doLogin() async{
    var url = Uri.parse(ApiSettings.LOGIN_USER);
    var response = await http.post(url, body: {
      "email":  emailController.text,
      "password" :  passwordController.text,
    },
    );
    print(response.statusCode);
    if(response.statusCode == 200){
      var jsonResponse  = response.body;

      Get.snackbar("Success", "Login Success", backgroundColor: Colors.green);
      Get.offNamedUntil(Routes.HOME, (route) => false);
      print(jsonResponse);
      UserPreferences().saveToken(jsonResponse);
      return true;
    }else{
      Get.snackbar("Filed", "Login Filed", backgroundColor: Colors.red);
      return false;
    }
  }


  // Future logout() async{
  //
  //   print("We are here");
  //   var url  = Uri.parse(ApiSettings.LOGOUT_USER);
  //   var response = await http.get(url , headers: {
  //     HttpHeaders.authorizationHeader : UserPreferences().getToken(),
  //   });
  //   print(response.statusCode);
  //   if(response.statusCode == 200){
  //     UserPreferences().logout();
  //     Get.offNamedUntil(Routes.LOGIN, (route) => false);
  //     return true;
  //   }
  //   return false;
  //
  // }
}
