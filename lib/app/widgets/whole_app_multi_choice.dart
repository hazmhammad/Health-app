import 'package:flutter/material.dart';
import 'package:whole/constants/constants.dart';

class WholeAppMultiChoice extends StatefulWidget {
  final String theChoiceText;

  const WholeAppMultiChoice({
    Key? key,
    required this.theChoiceText,
  }) : super(key: key);

  @override
  State<WholeAppMultiChoice> createState() => _WholeAppMultiChoiceState();
}

class _WholeAppMultiChoiceState extends State<WholeAppMultiChoice> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          widget.theChoiceText.toString(),
          style: regularTextStyle(16),
        ),
        leading: Theme(
          data: ThemeData(unselectedWidgetColor: KAccentGreen),
          child: Transform.scale(
            scale: 1.2,
            child: Radio(
              fillColor:
                  MaterialStateColor.resolveWith((states) => KAccentGreen),
              toggleable: true,
              value: 1,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as int;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
