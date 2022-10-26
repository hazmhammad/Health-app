import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:vertical_picker/vertical_picker.dart';
import 'package:whole/app/widgets/whole_app_bar.dart';
import 'package:whole/app/widgets/whole_app_circular_question.dart';
import 'package:whole/constants/constants.dart';
import '../../../widgets/whole_app_two_buttons.dart';
import '../controllers/assessment_controller.dart';

class AssessmentView extends GetView<AssessmentController> {
  List<String> itemsData = [
    "Indian",
    "Asian",
    "African",
    "Pacific",
    "White",
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssessmentController>(
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
              Center(
                child: Column(
                  children: [
                    WholeAppCircularQuestion(
                      height: 135.0,
                      prcentage: 1,
                      maxNum: 4,
                      stepNum: 1,
                      isLarge: false,
                      questionNumber: "Question 1",
                      theQuestion: "How much do you weigh?",
                      nextQuestion: "Your height",
                      icon: Whole_icons.person,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 350.0,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 150.0),
                              height: 50.0,
                              color: KAccentGreen,
                            ),
                            Positioned(
                              left: 230,
                              top: 157,
                              child: Text(
                                "kg",
                                style: regularTextStyle(30),
                              ),
                            ),
                            Center(
                              child: Obx(
                                () => NumberPicker(
                                  value: controller.defaultWeigh.value,
                                  minValue: 40,
                                  maxValue: 150,
                                  itemCount: 7,
                                  itemHeight: 50,
                                  selectedTextStyle: regularTextStyle(35),
                                  textStyle:
                                      TextStyle(fontSize: 25.0, color: kGrey),
                                  onChanged: (value) {
                                    controller.defaultWeigh.value = value;
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
                    RichText(
                      text: TextSpan(
                          text: "Change metric system",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("CLICKED!");
                            }),
                    ),
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
              /********************************************************/

              /* Question 2 */
              Center(
                child: Column(
                  children: [
                    WholeAppCircularQuestion(
                      height: 135.0,
                      prcentage: 50,
                      maxNum: 4,
                      stepNum: 2,
                      isLarge: false,
                      questionNumber: "Question 2",
                      theQuestion: "What is your height?",
                      nextQuestion: "Your waistline",
                      icon: Whole_icons.person,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 350.0,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 150.0),
                              height: 50.0,
                              color: KAccentGreen,
                            ),
                            Positioned(
                              left: 230,
                              top: 157,
                              child: Text(
                                "kg",
                                style: regularTextStyle(30),
                              ),
                            ),
                            Center(
                              child: Obx(
                                () => NumberPicker(
                                  value: controller.defaultHeight.value,
                                  minValue: 40,
                                  maxValue: 210,
                                  itemCount: 7,
                                  itemHeight: 50,
                                  selectedTextStyle: regularTextStyle(35),
                                  textStyle:
                                      TextStyle(fontSize: 25.0, color: kGrey),
                                  onChanged: (value) {
                                    controller.defaultHeight.value = value;
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
                    RichText(
                      text: TextSpan(
                          text: "Change metric system",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("CLICKED!");
                            }),
                    ),
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
              /********************************************************/

              /* Question 3 */
              Center(
                child: Column(
                  children: [
                    WholeAppCircularQuestion(
                      height: 135.0,
                      prcentage: 75,
                      maxNum: 4,
                      stepNum: 3,
                      isLarge: false,
                      questionNumber: "Question 3",
                      theQuestion: "What is your waistline?",
                      nextQuestion: "Your ethnicity",
                      icon: Whole_icons.person,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 350.0,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 150.0),
                              height: 50.0,
                              color: KAccentGreen,
                            ),
                            Positioned(
                              left: 230,
                              top: 157,
                              child: Text(
                                "cm",
                                style: regularTextStyle(30),
                              ),
                            ),
                            Center(
                              child: Obx(
                                () => NumberPicker(
                                  value: controller.defaultWaist.value,
                                  minValue: 100,
                                  maxValue: 200,
                                  itemCount: 7,
                                  itemHeight: 50,
                                  selectedTextStyle: regularTextStyle(35),
                                  textStyle:
                                      TextStyle(fontSize: 25.0, color: kGrey),
                                  onChanged: (value) {
                                    controller.defaultWaist.value = value;
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
                    RichText(
                      text: TextSpan(
                          text: "Change metric system",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("CLICKED!");
                            }),
                    ),
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
              /********************************************************/

              /* Question 4 */
              Center(
                child: Column(
                  children: [
                    WholeAppCircularQuestion(
                      height: 135.0,
                      prcentage: 100,
                      maxNum: 4,
                      stepNum: 4,
                      isLarge: false,
                      questionNumber: "Question 4",
                      theQuestion: "What is your ethnicity?",
                      nextQuestion: "Submit",
                      icon: Whole_icons.person,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 350.0,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 150.0),
                              height: 50.0,
                              color: KAccentGreen,
                            ),
                            Positioned(
                              left: 230,
                              top: 157,
                              child: Text(
                                "",
                                style: regularTextStyle(30),
                              ),
                            ),
                            Center(
                              child: Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 150.0),
                                      height: 50.0,
                                      color: KAccentGreen,
                                    ),
                                    Positioned(
                                      left: 240,
                                      top: 155,
                                      child: Text(
                                        "",
                                        style: regularTextStyle(30),
                                      ),
                                    ),
                                    Container(
                                      //color: KAccentGreen,
                                      height: 350.0,
                                      width: double.infinity,
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 150.0),
                                            height: 50.0,
                                            color: KAccentGreen,
                                          ),
                                          Positioned(
                                            left: 240,
                                            top: 155,
                                            child: Text(
                                              "",
                                              style: regularTextStyle(30),
                                            ),
                                          ),
                                          VerticalPicker(
                                            borderColor: kMidGray,
                                            // give height for eacch item
                                            itemHeight: 75.0,

                                            // create list of text for items
                                            items: List.generate(
                                              itemsData.length,
                                              (index) => Center(
                                                child: Text(
                                                  itemsData[index].toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 35.0,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            // empty void for item selected
                                            onSelectedChanged:
                                                (indexSelected) {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                    SizedBox(
                      height: 40.0,
                    ),
                    WholeAppTwoButtons(
                      leftButtonText: "BACK",
                      rightButtonText: "SUBMIT",
                      containerHeight: 100.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ///////////////////////////////////////////////////////////////////
  /* IGNORE */
  // The best design so far
  // Container(
  //   //color: KAccentGreen,
  //   height: 350.0,
  //   width: double.infinity,
  //   child: Stack(
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(top: 150.0),
  //         height: 50.0,
  //         color: KAccentGreen,
  //       ),
  //       Positioned(
  //         left: 240,
  //         top: 155,
  //         child: Text(
  //           "kg",
  //           style: regularTextStyle(30),
  //         ),
  //       ),
  //       VerticalPicker(
  //         borderColor: KAccentGreen,
  //         // give height for eacch item
  //         itemHeight: 75.0,

  //         // create list of text for items
  //         items: List.generate(
  //           10,
  //           (index) => Center(
  //             child: Text(
  //               index.toString(),
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 35.0,
  //               ),
  //             ),
  //           ),
  //         ),

  //         // empty void for item selected
  //         onSelectedChanged: (indexSelected) {},
  //       ),
  //     ],
  //   ),
  // ),

  // My work for the number picker
  // Expanded(
  //   child: Stack(
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(top: 150.0),
  //         height: 50.0,
  //         color: KAccentGreen,
  //       ),
  //       Positioned(
  //         left: 240,
  //         top: 155,
  //         child: Text(
  //           "kg",
  //           style: regularTextStyle(30),
  //         ),
  //       ),
  //       ListView.builder(
  //         shrinkWrap: true,
  //         itemCount: itemsData.length,
  //         itemBuilder: (context, index) {
  //           return Column(
  //             children: [
  //               Container(
  //                 margin: EdgeInsets.symmetric(vertical: 10.0),
  //                 width: double.maxFinite,
  //                 height: 50.0,
  //                 child: Center(
  //                   child: Text(
  //                     "70",
  //                     style: regularTextStyle(35.0),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           );
  //         },
  //       ),
  //     ],
  //   ),
  // ),
  //////////////////////////////////////////////////////////////////

}
