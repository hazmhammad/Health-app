import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:whole/app/modules/bmi/views/assessment_view.dart';
import 'package:whole/app/widgets/whole_app_bar.dart';
import 'package:whole/app/widgets/whole_app_button.dart';

import '../controllers/bmi_controller.dart';

class BmiView extends GetView<BmiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 81, 77, 96),
      appBar: WholeAppBar(
        titleText: "BMI",
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
                    "Body Mass Index (BMI)",
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
                margin: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 150.0),
                color: Color.fromARGB(255, 105, 103, 112),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 30.0, 10.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What is Body Mass Index?",
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
                        "Body Mass Index (BMI) is a person’s weight in kilograms divided by the square of height in meters",
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
                        "Why is it important to me?",
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
                        "A high BMI can be an indicator of high body fatness. BMI can be used to screen for weight categories that may lead to health problems but it is not diagnostic of the body fatness or health of an individual.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
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
                                    return AssessmentView();
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
