import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:whole/constants/constants.dart';
import '../controllers/assessment_controller.dart';

class WholeAppCircularQuestion extends StatefulWidget {
  final int prcentage;
  final height;
  var maxNum;
  var stepNum;
  final isLarge;
  final String questionNumber;
  final String theQuestion;
  final nextQuestion;
  final bool showNextQuestion;
  final IconData icon;

  final expanded;

  WholeAppCircularQuestion(
      {Key? key,
      required this.prcentage,
      required this.height,
      this.maxNum,
      this.stepNum,
      required this.isLarge,
      required this.questionNumber,
      required this.theQuestion,
      this.showNextQuestion = true,
      this.nextQuestion,
      required this.icon,
      this.expanded})
      : super(key: key);

  @override
  State<WholeAppCircularQuestion> createState() =>
      _WholeAppCircularQuestionState();
}

class _WholeAppCircularQuestionState extends State<WholeAppCircularQuestion> {
  @override
  Widget build(BuildContext context) {
    var lineWidth = 15.0;
    var radius = 75.0;
    var containerSize = 77.0;
    var iconSize = 40.0;

    return Row(
      children: [
        Container(
          //color: Colors.amber,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 30.0),
                child: Column(
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
                          color: Colors.white.withOpacity(0.10),
                        ),
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
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${widget.stepNum} / ${widget.maxNum}',
                      style: regularTextStyle(16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(

          height: widget.height,
          width: 220.0,
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.questionNumber.toString(),
                  style: regularTextStyle(16),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.theQuestion.toString(),
                  style: boldTextStyle(20),
                ),
                SizedBox(
                  height: 15.0,
                ),
                if (widget.showNextQuestion)
                  Text(
                    "Next: " + widget.nextQuestion.toString(),
                    style: TextStyle(
                      fontFamily: "Robo",
                      fontSize: 12.0,
                      color: kGrey,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void nextQuestionVisible() {
    if (widget.showNextQuestion) {
      Text(
        "Next: " + widget.nextQuestion.toString(),
        style: TextStyle(
          fontFamily: "Robo",
          fontSize: 12.0,
          color: kGrey,
        ),
      );
    } else {
      Text(
        "",
      );
    }
  }
}
