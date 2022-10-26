import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/modules/MAAP/Models/Data.dart';
import 'package:whole/app/modules/MAAP/views/maap_result_view.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/app/widgets/whole_app_circular_question.dart';
import 'package:whole/app/widgets/whole_app_scaffold.dart';
import 'package:whole/app/widgets/whole_app_two_buttons.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/constants.dart';
import 'package:whole/constants/style.dart';
import 'package:whole/constants/whole_icons_icons.dart';

import '../controllers/maap_controller.dart';

class MaapView extends GetView<MaapController> {
  @override
  Widget build(BuildContext context) {
    MaapController _maapController = Get.put(MaapController());
    return WholeAppScaffold(
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _maapController.pageController,
          itemCount: _maapController.questions.length,
          onPageChanged: _maapController.updateQuestionNumber,
          itemBuilder: (context, index) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WholeAppCircularQuestion(
                prcentage:
                    (((index + 1) / _maapController.questions.length) * 100)
                        .toInt(),
                isLarge: false,
                questionNumber: "Question: ${index + 1}",
                maxNum: _maapController.questions.length,
                stepNum: index + 1,
                theQuestion: _maapController.questions[index].question,
                icon: Whole_icons.whole,
                showNextQuestion: false,
                height: null,
              ),
              SizedBox(
                height: 50,
              ),
              //Option()
              Expanded(
                //flex: 2,
                child: Container(
                  // height: 450,
                  margin: EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: 6,
                    itemExtent: 50,
                    itemBuilder: ((context, index) => Card(
                          color: Colors.transparent,
                          shadowColor: Colors.transparent,
                          child: ListTile(
                            tileColor: Colors.transparent,
                            title: Text(
                              " ${sample_data[index]['options'][index]}",
                              style: regularTextStyle(16),
                            ),
                            leading: SizedBox(
                                width: 50,
                                height: 50,
                                child: _maapController.optionIcon),
                            onTap: () {
                              //action on tapped item
                              //change icon to filled circle
                              // store index+1 as result
                            },
                          ),
                        )),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: Get.width,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Row(children: [
                  Expanded(
                      child: WholeAppOutlinedButton(
                          text: "BACK",
                          onPressed: () {
                            _maapController.pageController.previousPage(
                                duration: Duration(milliseconds: 150),
                                curve: Curves.easeIn);
                          })),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    //TODO: when it reach the last Q change to submit and go to result page
                    child: WholeAppButton(
                        text: controller.buttonText,
                        onPressed: () {
                          controller.goToResult(index);
                        }),
                  ),
                ]),
              )
            ],
          ),
        ),
        hasAppBar: true);
  }
}
