import 'package:flutter/material.dart';

import '../../constants/style.dart';

//This is the  main button with Outline
class WholeOutlineButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const WholeOutlineButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text.toUpperCase(),
        style: regularTextStyle(16, KAccentGreen),
      ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              EdgeInsets.only(right: 13, top: 10, left: 13, bottom: 10)),
          foregroundColor: MaterialStateProperty.all<Color>(KAccentGreen),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: KAccentGreen),
          ))),
    );
  }
}
