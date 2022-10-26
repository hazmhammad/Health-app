import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/modules/MAAP/Models/Data.dart';
import 'package:whole/app/modules/MAAP/controllers/maap_introduction_controller.dart';
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

class MaapIntroductionView extends GetView<MaapIntroductionController> {
  @override
  Widget build(BuildContext context) {
    // MaapController _maapController = Get.put(MaapController());
    return WholeAppScaffold(
        body: Container(
          height: Get.height,
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Text(
                "Mindfulness Assessment (MAAP)",
                style: boldTextStyle(25),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                padding:
                    EdgeInsets.only(top: 25, bottom: 25, left: 20, right: 20),
                color: kLightGray,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "What is mindfulness?",
                        style: boldTextStyle(20),
                      ),
                      Text(
                        "Mindfulness is the basic human ability to be fully present, aware of where we are and what we’re doing, and not overly reactive or overwhelmed by what’s going on around us. \n \n Mindfulness is a quality that every human being already possesses - you just need to learn how to access it.",
                        style: regularTextStyle(16),
                      ),
                      Text(
                        "Why is it important to me?",
                        style: boldTextStyle(20),
                      ),
                      Text(
                        "While people all have different levels of  mindfulness, those who have effectively refined their level of mindfulness are able to live with higher levels of autonomy, a more pleasant impact on others, liveliness and satisfaction.",
                        style: regularTextStyle(16),
                      ),
                      Text(
                        "Source: Mindful Attention Awareness Scale (Brown, Ryan, 2003).",
                        style: regularTextStyle(14),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      WholeAppButton(
                          text: "start assessment".toUpperCase(),
                          onPressed: () {
                            Get.to(MaapView());
                          })
                    ]),
              )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        hasAppBar: true);
  }
}
