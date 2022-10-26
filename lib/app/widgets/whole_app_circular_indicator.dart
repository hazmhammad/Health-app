// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:whole/constants/constants.dart';

class WholeAppCircularIndicator extends StatefulWidget {
  var prcentage;
  final isLarge;
  final title;
  final IconData icon;

  final expanded;

  WholeAppCircularIndicator(
      {Key? key,
      required this.prcentage,
      required this.isLarge,
      this.title,
      required this.icon,
      this.expanded})
      : super(key: key);

  @override
  State<WholeAppCircularIndicator> createState() =>
      _WholeAppCircularIndicatorState();
}

class _WholeAppCircularIndicatorState extends State<WholeAppCircularIndicator> {
  @override
  Widget build(BuildContext context) {
    var lineWidth = 15.0;
    var radius = 75.0;
    var containerSize = 77.0;
    var iconSize = 40.0;

    if (widget.isLarge) {
      return Container(
        child: CircularPercentIndicator(
          radius: radius,
          lineWidth: lineWidth,
          animation: true,
          percent: widget.prcentage * 0.01,
          center: Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white.withOpacity(0.10)),
            child: Icon(
              widget.icon,
              size: iconSize,
              color: Colors.white.withOpacity(0.50),
            ),
          ),
          footer: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 26.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.prcentage.toString(),
                  style: boldTextStyle(26, Colors.white),
                ),
                Text(' / 100', style: regularTextStyle(26, Colors.white))
              ],
            ),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: KAccentGreen,
          backgroundColor: Colors.white.withOpacity(0.30),
        ),
      );
    } else {
      return Container(
        child: Row(
          children: [
            CircularPercentIndicator(
              radius: radius * 0.5,
              lineWidth: lineWidth * 0.5,
              animation: true,
              percent: widget.prcentage * 0.01,
              center: Container(
                width: containerSize * 0.5,
                height: containerSize * 0.5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.10)),
                child: Icon(
                  widget.icon,
                  size: iconSize * 0.7,
                  color: Colors.white.withOpacity(0.50),
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: KAccentGreen,
              backgroundColor: Colors.white.withOpacity(0.30),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title.toString(),
                      style: boldTextStyle(14, Colors.white)),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.prcentage.toString(),
                          style: boldTextStyle(16, Colors.white),
                        ),
                        Text(' / 100',
                            style: regularTextStyle(16, Colors.white))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
