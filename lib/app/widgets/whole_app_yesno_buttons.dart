import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class WholeAppYesNoButtons extends StatefulWidget {
  final double containerHeight;

  const WholeAppYesNoButtons({
    Key? key,
    required this.containerHeight,
  }) : super(key: key);

  @override
  State<WholeAppYesNoButtons> createState() => _WholeAppYesNoButtonsState();
}

class _WholeAppYesNoButtonsState extends State<WholeAppYesNoButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: widget.containerHeight,
      //color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "NO",
              style: TextStyle(fontSize: 16.0, color: kGrayDisBtnT),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(148, 45),
              primary: kGrayDisBtnB,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(50.0)),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "YES",
              style: TextStyle(fontSize: 16.0),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(148, 45),
              primary: KAccentGreen,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(50.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
