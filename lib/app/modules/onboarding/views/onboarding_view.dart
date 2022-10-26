import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../preferences/user_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/whole_app_button.dart';
import '../../../widgets/whole_app_scaffold.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WholeAppScaffold(
      hasAppBar: false,
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      onPageChanged: (index){
                        if(index == 4){
                          Get.offAndToNamed(Routes.LANDING);
                          UserPreferences().setFirstVist();

                        }
                      },
                      controller: OnboardingController.to.pageController,
                      children: [
                        WhiteBox(
                          imagePath: "assets/images/phone-message.png",
                          textSpan: [
                            TextSpan(text: 'Introducing '),
                            TextSpan(
                                text: 'WHOLE',
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold)),
                          ],
                          description:
                              "WHOLE is radically different app focused on your health. It empowers YOU to take control of your own health in a pro-active approach, guiding you on a daily basis.",
                        ),
                        WhiteBox(
                          imagePath: "assets/images/heart.png",
                          textSpan: [
                            TextSpan(text: 'What makes me '),
                            TextSpan(
                                text: 'WHOLE?',
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold)),
                          ],
                          description:
                              "Being healthy doesn’t only happen in your body. WHOLE covers your physical health, as well as your Environment, your Mind, and your Spirit - all factors that influence your holistic wellbeing.",
                        ),
                        WhiteBox(
                          imagePath: "assets/images/water-phone.png",
                          textSpan: [
                            TextSpan(text: 'Keep track'),
                          ],
                          description:
                              "WHOLE builds up a history of your health based on your activities in the app. It offers a complete Electronic Health Record that you can use to keep track yourself, or share with healthcare professionals.",
                        ),
                        WhiteBox(
                          imagePath: "assets/images/user-stats.png",
                          textSpan: [
                            TextSpan(text: 'How does '),
                            TextSpan(
                                text: 'WHOLE',
                                style:
                                    new TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: ' work?'),
                          ],
                          description:
                              "WHOLE guides you through aseries of assessments and activities on a regular basis to understand your current level of holistic health. Based on your responses, WHOLE provides tools, tips and articles to help you maintain or improve your overall health.",
                        ),
                        WhiteBox(
                          imagePath: "assets/images/phone-charts.png",
                          textSpan: [
                            TextSpan(text: 'A moving target?'),
                          ],
                          description:
                              "WHOLE calculates a score for you based on the number of assessments completed, your results and the amount of activities you have completed to improve your holistic health. Because we are constantly adding the latest research into WHOLE, you need to regularly use WHOLE to maintain and improve your score.",
                        ),
                      ],
                    ),
                  ),

                  SmoothPageIndicator(
                      controller: OnboardingController.to.pageController, // PageController
                      count: 5,
                      effect: ExpandingDotsEffect(
                          activeDotColor:
                              Colors.white), // your preferred effect
                      onDotClicked: (index) {
                        OnboardingController.to.pageController.jumpToPage(index);
                      }),

                  SizedBox(
                    height: 30,
                  ),
                  // WholeAppButton(text: "error", onPressed: () {
                  //   nextPage();
                  // },),
                  Container(
                    margin: EdgeInsets.only(right: 30, left: 30),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        OnboardingController.to.nextPage();
                      },
                      child: Text("NEXT", style: TextStyle(fontSize: 16)),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xff1FE0CC)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhiteBox extends StatelessWidget {
  final String imagePath;
  final List<TextSpan> textSpan;
  final String description;

  const WhiteBox({
    Key? key,
    required this.imagePath,
    required this.textSpan,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset(
            imagePath,
            height: 175,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),

            child: RichText(
                text: TextSpan(
              style: new TextStyle(
                color: Color(0xff4A4A4A),
                fontSize: 25,
              ),
              children: textSpan,
            )),

            // child: Text(
            //   title,
            //   style: TextStyle(
            //     color: Color(0xff4A4A4A),
            //     fontSize: 25,
            //   ),
            // ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              description,
              style: TextStyle(
                color: Color(0xff4A4A4A),
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
