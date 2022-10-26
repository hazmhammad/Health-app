import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class WholeAppAssessmentWidget extends StatelessWidget {
  final color;
  final title;
  final icon;
  final toPage;

  const WholeAppAssessmentWidget({
    Key? key,
    required this.color,
    required this.title,
    required this.icon,
    required this.toPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Material(
          child: InkWell(
            splashColor: Colors.white70,
            onTap: () {
              Get.toNamed(toPage);
            },
            child: new Container(
              width: Get.width,
              height: 98,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Icon(
                        icon,
                        size: 36,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Text(
                        title,
                        style: boldTextStyle(16, Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          color: Colors.transparent,
        ),
        color: color,
      ),
    );
  }
}
