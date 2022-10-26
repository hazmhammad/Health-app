import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/modules/chronic/views/chronic_assessment_view.dart';

import '../../../widgets/whole_app_bar.dart';
import '../controllers/chronic_controller.dart';

class ChronicView extends GetView<ChronicController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 81, 77, 96),
      appBar: WholeAppBar(
        titleText: "Chronic",
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text(
                    "Chronic Disease Screen",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 5.0),
                color: Color.fromARGB(255, 105, 103, 112),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What is Chronic Disease?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Chronic diseases are conditions that last at least 1 year and require ongoing medical attention or limit activities of daily living. Chronic diseases including heart disease, cancer and diabetes are the leading causes of death and disability worldwide.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Why is it Important to me?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto",
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Healthcare provided by professionals represents just the ‘tip of the ice-berg’ in supporting patients with chronic conditions.\n\nThe majority of care for chronic conditions is done by the person themselves with the support of family members.\n\nA person with diabetes has on average 3 hours contact a year with their healthcare team. They self-manage their condition for the remaining 8757 hours.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 31, 224, 204),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              padding:
                                  EdgeInsets.fromLTRB(80.0, 15.0, 80.0, 15.0),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ChronicAssessmentView();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "START ASSESSMENT",
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

