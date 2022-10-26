import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:vertical_picker/vertical_picker.dart';
import 'package:whole/app/modules/chronic/controllers/chronic_assessment_controller.dart';

import '../../../../constants/style.dart';
import '../../../../constants/whole_icons_icons.dart';
import '../../../widgets/whole_app_bar.dart';
import '../../../widgets/whole_app_circular_question.dart';
import '../../../widgets/whole_app_multi_choice.dart';
import '../../../widgets/whole_app_two_buttons.dart';
import '../../../widgets/whole_app_yesno_buttons.dart';

class ChronicAssessmentView extends GetView<ChronicAssessmentController> {
  List<String> itemsData = [
    "Indian",
    "Asian",
    "African",
    "Pacific",
    "White",
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChronicAssessmentController>(
      init: controller,
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 81, 77, 96),
          appBar: WholeAppBar(
            titleText: "",
          ),
          body: PageView(
            onPageChanged: (index) {
              print("Page ${index + 1}");
            },
            children: [
              /* Question 1 */
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      WholeAppCircularQuestion(
                        height: 158.0,
                        prcentage: 1,
                        maxNum: 3,
                        stepNum: 1,
                        isLarge: false,
                        questionNumber: "Question 1",
                        theQuestion:
                            "Have you tested your blood glucose (sugar) in the last 6 months?",
                        nextQuestion: "Total cholesterol",
                        icon: Whole_icons.person,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50.0,
                        child: Center(
                          child: WholeAppYesNoButtons(containerHeight: 40.0),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "What was the result?",
                            style: boldTextStyle(20.0),
                          ),
                        ],
                      ),
                      Container(
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 100.0),
                                height: 50.0,
                                color: KAccentGreen,
                              ),
                              Positioned(
                                left: 230,
                                top: 110,
                                child: Text(
                                  "mmol/l",
                                  style: regularTextStyle(25),
                                ),
                              ),
                              Center(
                                child: Obx(
                                  () => NumberPicker(
                                    value: controller.defaultGlucose.value,
                                    minValue: 1,
                                    maxValue: 10,
                                    itemCount: 5,
                                    itemHeight: 50,
                                    selectedTextStyle: regularTextStyle(35),
                                    textStyle:
                                        TextStyle(fontSize: 25.0, color: kGrey),
                                    onChanged: (value) {
                                      controller.defaultGlucose.value = value;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "Was the test taken while fasting?",
                            style: boldTextStyle(20.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      WholeAppMultiChoice(
                          theChoiceText: "I did eat 6 hours before the test"),
                      WholeAppMultiChoice(
                          theChoiceText:
                              "I did NOT eat 6 hours before the test"),
                      SizedBox(
                        height: 20.0,
                      ),
                      WholeAppTwoButtons(
                        leftButtonText: "CANCEL",
                        rightButtonText: "NEXT",
                        containerHeight: 100.0,
                      ),
                    ],
                  ),
                ),
              ),
              /********************************************************/

              /* Question 2 */

              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      WholeAppCircularQuestion(
                        height: 158.0,
                        prcentage: 1,
                        maxNum: 3,
                        stepNum: 1,
                        isLarge: false,
                        questionNumber: "Question 2",
                        theQuestion:
                            "Have you tested your total cholesterol in the last 6 months?",
                        nextQuestion: "Blood pressure",
                        icon: Whole_icons.person,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50.0,
                        child: Center(
                          child: WholeAppYesNoButtons(containerHeight: 40.0),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "What was the result?",
                            style: boldTextStyle(20.0),
                          ),
                        ],
                      ),
                      Container(
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 100.0),
                                height: 50.0,
                                color: KAccentGreen,
                              ),
                              Positioned(
                                left: 250,
                                top: 110,
                                child: Text(
                                  "mmol/l",
                                  style: regularTextStyle(25),
                                ),
                              ),
                              Positioned(
                                left: 193,
                                top: 100,
                                child: Text(
                                  ".",
                                  style: regularTextStyle(40),
                                ),
                              ),
                              Center(
                                child: Obx(
                                  () => DecimalNumberPicker(
                                    value: controller.defaultCholesterol.value,
                                    minValue: 0,
                                    maxValue: 10,
                                    itemCount: 5,
                                    itemHeight: 50,
                                    itemWidth: 50.0,
                                    selectedTextStyle: regularTextStyle(35),
                                    textStyle:
                                        TextStyle(fontSize: 25.0, color: kGrey),
                                    onChanged: (value) {
                                      controller.defaultCholesterol.value =
                                          value;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "Was the test taken while fasting?",
                            style: boldTextStyle(20.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      WholeAppMultiChoice(
                          theChoiceText: "I did eat 6 hours before the test"),
                      WholeAppMultiChoice(
                          theChoiceText:
                              "I did NOT eat 6 hours before the test"),
                      SizedBox(
                        height: 20.0,
                      ),
                      WholeAppTwoButtons(
                        leftButtonText: "BACK",
                        rightButtonText: "NEXT",
                        containerHeight: 100.0,
                      ),
                    ],
                  ),
                ),
              ),
              /********************************************************/

              /* Question 3 */

              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      WholeAppCircularQuestion(
                        height: 158.0,
                        prcentage: 1,
                        maxNum: 3,
                        stepNum: 1,
                        isLarge: false,
                        questionNumber: "Question 3",
                        theQuestion:
                            "Have you tested your blood pressure in the last 6 months?",
                        nextQuestion: "Submit",
                        icon: Whole_icons.person,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 50.0,
                        child: Center(
                          child: WholeAppYesNoButtons(containerHeight: 40.0),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "What was the result?",
                            style: boldTextStyle(20.0),
                          ),
                        ],
                      ),
                      Container(
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 100.0),
                                height: 50.0,
                                color: KAccentGreen,
                              ),
                              Positioned(
                                left: 195,
                                top: 104,
                                child: Text(
                                  "/",
                                  style: regularTextStyle(35),
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(
                                      () => NumberPicker(
                                        value: controller.defaultDiastole.value,
                                        minValue: 1,
                                        maxValue: 220,
                                        itemCount: 5,
                                        itemHeight: 50,
                                        itemWidth: 75.0,
                                        selectedTextStyle: regularTextStyle(35),
                                        textStyle: TextStyle(
                                            fontSize: 25.0, color: kGrey),
                                        onChanged: (value) {
                                          controller.defaultDiastole.value =
                                              value;
                                        },
                                      ),
                                    ),
                                    Obx(
                                      () => NumberPicker(
                                        value: controller.defaultSystole.value,
                                        minValue: 20,
                                        maxValue: 100,
                                        itemCount: 5,
                                        itemHeight: 50,
                                        itemWidth: 75,
                                        selectedTextStyle: regularTextStyle(35),
                                        textStyle: TextStyle(
                                            fontSize: 25.0, color: kGrey),
                                        onChanged: (value) {
                                          controller.defaultSystole.value =
                                              value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "Was the test taken while fasting?",
                            style: boldTextStyle(20.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      WholeAppMultiChoice(
                          theChoiceText: "I did eat 6 hours before the test"),
                      WholeAppMultiChoice(
                          theChoiceText:
                              "I did NOT eat 6 hours before the test"),
                      SizedBox(
                        height: 20.0,
                      ),
                      WholeAppTwoButtons(
                        leftButtonText: "BACK",
                        rightButtonText: "SUBMIT",
                        containerHeight: 100.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
