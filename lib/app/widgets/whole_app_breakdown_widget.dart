import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/constants/constants.dart';

class BreakdownWidget extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback expand;
  final Widget breakDownWidget;
  final height;
  const BreakdownWidget({
    Key? key,
    required this.isExpanded,
    required this.expand,
    required this.breakDownWidget,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height2 = isExpanded ? Get.height * 0.65 : 0;
    return AnimatedContainer(

      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      color: Colors.transparent,
      height: isExpanded ? height : 50,
      width: Get.width,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 20.0,
            child: AnimatedContainer(
              height: isExpanded ? height : 0,
              width: Get.width,
              decoration: BoxDecoration(
                color: kDarkGrey,
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: breakDownWidget,
            ),
          ),
          Positioned(
            top: 0,
            child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isExpanded ? 'CLOSE BREAKDOWN' : 'TAB TO VIEW BREAKDOWN',
                    ),
                    Icon(
                      isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      size: 40,
                    )
                  ],
                ),
                onPressed: () {
                  expand();
                },
                style: ButtonStyle(
                    fixedSize:
                        MaterialStateProperty.all(Size(Get.width - 60, 45)),
                    backgroundColor: MaterialStateProperty.all(KAccentGreen),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )))),
          ),
        ],
      ),
    );
  }
}
