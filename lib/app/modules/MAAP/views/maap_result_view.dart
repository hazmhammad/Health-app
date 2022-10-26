import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/modules/MAAP/Models/Data.dart';
import 'package:whole/app/modules/MAAP/controllers/maap_result_controller.dart';
import 'package:whole/app/modules/MAAP/views/maap_view.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/app/widgets/whole_app_circular_question.dart';
import 'package:whole/app/widgets/whole_app_scaffold.dart';
import 'package:whole/app/widgets/whole_app_two_buttons.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/constants.dart';
import 'package:whole/constants/style.dart';
import 'package:whole/constants/whole_icons_icons.dart';

import '../controllers/maap_controller.dart';

class MaapResultView extends GetView<MaapResultController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MaapResultController>(
        init: controller,
        builder: (controller) {
          return WholeAppScaffold(
            //create a widget
            body: SingleChildScrollView(
              child: Container(
                width: Get.width,
                height: Get.height,
                margin: EdgeInsets.all(30),
                child: ListView(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.done_sharp,
                        color: kDarkGrey,
                        size: 80,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Congratulations Paul!",
                      style: boldTextStyle(25),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You’ve completed the Mindfulness Assessment (MAAP)!",
                      style: boldTextStyle(16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'You’ve Increased your ',
                        style: regularTextStyle(16),
                        // style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              //male mind dynamic
                              text: 'mind'.toUpperCase(),
                              style: boldTextStyle(16)),
                          TextSpan(
                            //make point dynamics
                            text: ' Score by 2 Points',
                            style: regularTextStyle(16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Container(
                        height: 5,
                        width: 60,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Result".toUpperCase(),
                      style: boldTextStyle(20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ScoreColor(
                        title: "High mindfulness",
                        subtitle: "",
                        score: "3.75",
                        color: kGreen),
                    SizedBox(
                      height: 20,
                    ),
                    BreakdownWidget(
                        breakDownWidget: Container(
                          padding: EdgeInsets.all(30),
                          //height: 30,
                          width: Get.width,
                          color: kDarkGrey,
                          child: ListView(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Below is a breakdown of how your MIND is calculated.",
                                style: regularTextStyle(14),
                              ),
                            ),
                            Container(
                              color: kGreen,
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 60,
                                    color: kGreen,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 70,
                                    child: Text(
                                      ">3.75",
                                      style: boldTextStyle(16),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 1,
                                    height: 40,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "High mindfulness",
                                    style: boldTextStyle(16),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.white,
                              height: 0,
                            ),
                            Container(
                              //color: kGreen,
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 60,
                                    color: kOrange,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 70,
                                    child: Text(
                                      "2.25-3.75",
                                      style: regularTextStyle(16),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 1,
                                    height: 40,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Average mindfulness",
                                      style: regularTextStyle(16)),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.white,
                              height: 0,
                            ),
                            Container(
                              //color: kGreen,
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 60,
                                    color: kRed,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 70,
                                    child: Text(
                                      "<2.25",
                                      style: regularTextStyle(16),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 1,
                                    height: 40,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("Low mindfulness",
                                      style: regularTextStyle(16)),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.white,
                              height: 0,
                            ),
                          ]),
                        ),
                        isExpanded: controller.expanded,
                        expand: controller.expand,
                        height: Get.height * .35),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: Get.width,
                      child: Text(
                        "Recommended".toUpperCase(),
                        style: boldTextStyle(20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //replace it with carousel plugin
                    // WholeAppArticleCard(
                    //   points: 3,
                    //     title: "How do I lose weight? ",
                    //     learnMore: () {},
                    //     description:
                    //         "A short article explaining the basics of losing weight"),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: Get.width,
                      child: WholeAppButton(
                          text: "done".toUpperCase(),
                          onPressed: () {
                            //return to home screen
                          }),
                    ),
                  ],
                ),
              ),
            ),
            hasAppBar: true,
          );
        });
  }
}
