import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:whole/app/modules/login/controllers/login_controller.dart';
import '../../constants/constants.dart';

class BuildPasswordTextField extends StatelessWidget {
  var isPasswordHidden;
  final VoidCallback showPassword;

 final TextEditingController controller;
  var VisibilityIcon;
  final String? Function(String? value)? validator;

  BuildPasswordTextField({
    required this.VisibilityIcon,
    required this.errorColor,
    required this.controller,
    required this.isPasswordHidden,
    required this.showPassword,
   required this.validator,
  });
  final errorColor;

  //final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
          obscureText: isPasswordHidden,
          decoration: InputDecoration(
            hintText: 'eg: password',
            hintStyle: TextStyle(color: kGrayishWhite),
            errorStyle: regularTextStyle(14, errorColor),
            errorMaxLines: 5,

            contentPadding: EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
            filled: true,
            fillColor: kLightGray,
            //create a an icon in showPassword
            suffixIcon: IconButton(
              icon: Icon(
                VisibilityIcon,
                color: Colors.white,
              ),
              onPressed: showPassword,
            ),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(0),
            ),
            errorBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: errorColor, width: 2),
            ),
            focusedErrorBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: errorColor, width: 2),
            ),
          ),
        controller: controller,
         validator: validator,

      ),
    );
  }
}
