import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/modules/profile/controllers/profile_edit_controller.dart';
import 'package:whole/constants/constants.dart';

class WholeAppTwoButtons extends StatefulWidget {
  final String rightButtonText;
  final String leftButtonText;
  final double containerHeight;

  const WholeAppTwoButtons({
    Key? key,
    required this.rightButtonText,
    required this.leftButtonText,
    required this.containerHeight,
  }) : super(key: key);

  @override
  State<WholeAppTwoButtons> createState() => _WholeAppTwoButtonsState();
}

class _WholeAppTwoButtonsState extends State<WholeAppTwoButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: widget.containerHeight,
      //color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () => PageController(initialPage: 0).previousPage(
                duration: Duration(seconds: 1), curve: Curves.easeIn),
            child: Text(
              widget.leftButtonText.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
            style: OutlinedButton.styleFrom(
              fixedSize: Size(148, 45),
              primary: KAccentGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              side: BorderSide(color: KAccentGreen),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          ElevatedButton(
            // onPressed: () => PageController(initialPage: 0)
            //     .nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn),
         onPressed: () => ProfileEditController.to.checkUpdateProfileForm(),
            child: Text(
              widget.rightButtonText.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(148, 45),
              primary: KAccentGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
