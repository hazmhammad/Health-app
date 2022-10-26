import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class BuildNameTextField extends StatelessWidget {
TextEditingController controller;
   BuildNameTextField({
 required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Natie',
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
        keyboardType: TextInputType.name,
        controller: controller,
        validator: ((value) {
          if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
            return 'Please ensure a valid name';
          } else {
            return null;
          }
        }
        ),
      ),
    );
  }
}
