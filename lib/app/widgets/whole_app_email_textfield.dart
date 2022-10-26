import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:whole/app/modules/login/controllers/login_controller.dart';
import 'package:whole/app/modules/register/controllers/register_controller.dart';

import '../../constants/constants.dart';

class BuildEmailTextField extends StatelessWidget {
  TextEditingController controller;
   BuildEmailTextField({
  required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //validation box color
      // color: kRed,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'eg: name.surname@gmail.com',
          hintStyle: TextStyle(color: kGrayishWhite),
          errorStyle: regularTextStyle(14, kDangerRed),
          errorMaxLines: 5,
          contentPadding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
          filled: true,
          fillColor: kLightGray,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(0),
          ),
          errorBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: kDangerRed, width: 2),
          ),
          focusedErrorBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: kDangerRed, width: 2),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        validator: (String? value) {
          if (!GetUtils.isEmail(value!)) {
            return "Provide valid Email";
          }
          return null;
          },
      ),
    );
  }
}
