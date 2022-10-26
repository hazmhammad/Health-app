// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/constants.dart';

class WholeAppStatWidget extends StatefulWidget {
  final title;
  var percentage;
  final IconData icon;
  final toPage;
  WholeAppStatWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.percentage,
      required this.toPage})
      : super(key: key);
  @override
  State<WholeAppStatWidget> createState() => _WholeAppStatWidgetState();
}

class _WholeAppStatWidgetState extends State<WholeAppStatWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30),
          child: Stack(
            children: [
              Positioned(
                child: WholeAppCircularIndicator(
                  prcentage: widget.percentage,
                  isLarge: false,
                  icon: widget.icon,
                  title: widget.title,
                ),
              ),
              Positioned(
                bottom: 4,
                right: 0,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(KAccentGreen),
                    overlayColor: MaterialStateProperty.all(Colors.white10),
                  ),
                  onPressed: () {
                    Get.toNamed(widget.toPage);
                  },
                  child: Text(
                    'View More',
                    style: underlineRegularTextStyle(16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
