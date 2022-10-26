import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/constants/constants.dart';

class WholeAppOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const WholeAppOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: OutlinedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Roboto', fontSize: 16, color: KAccentGreen),
          ),
          style: OutlinedButton.styleFrom(
            primary: KAccentGreen,
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 13, right: 13),
            shape: (RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            )),
            side: BorderSide(color: KAccentGreen),
          )),
    );
  }
}
