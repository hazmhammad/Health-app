import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/constants/constants.dart';

class WholeAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const WholeAppButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: regularTextStyle(14, Colors.white)),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(KAccentGreen),
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.only(top: 15, bottom: 15, left: 13, right: 13)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ))),
      ),
    );
  }
}
