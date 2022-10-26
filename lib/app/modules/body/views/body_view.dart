import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:whole/app/models/Artical.dart';
import 'package:whole/app/modules/home/controllers/home_controller.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/app/widgets/whole_app_scores_chart.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/constants.dart';
import 'package:whole/constants/globals.dart';

import '../controllers/body_controller.dart';

class BodyView extends GetView<BodyController> {



  final pageController =
      PageController(viewportFraction: 0.8, keepPage: false, initialPage: 0);

  final pages = List.generate(
      3,
      (index) {
        // WholeAppArticleCard(
        //   article: ,
        // ));
      });

  @override
  Widget build(BuildContext context) {
    var rout = ModalRoute.of(context)?.settings.name;

    return GetBuilder<BodyController>(
      init: controller,
      builder: (controller) {
        return WholeAppScaffold(
            title: 'Body',
            hasAppBar: true,
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kMidGray,
                  Color(0xff121113),
                ],
                stops: [0.0, 1.0],
              )),
              child: Center(
                  child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: Text(
                          'Your Body Score',
                          style: boldTextStyle(25),
                        ),
                      ),
                      WholeAppCircularIndicator(
                        prcentage: HomeController.to.score.first.score!.body,
                        isLarge: true,
                        icon: Whole_icons.person,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: BreakdownWidget(
                        height: Get.height * .45,
                        isExpanded: controller.expanded,
                        expand: controller.expand,
                        breakDownWidget: AnimatedSwitcher(
                          duration: Duration(seconds: 1),
                          child: controller.expanded
                              ? Container(
                                  key: Key('1'),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30.0),
                                          child: Text(
                                            'Below is a breakdown of your Body Score.',
                                            style: boldTextStyle(14),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Scrollbar(
                                          radius: Radius.circular(50),
                                          thickness: 10,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  30, 0, 30, 25),
                                              width: 800,
                                              height: 250,
                                              child: WholeAppScoresChart(
                                                data: controller.data,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: TextButton(
                                              style: ButtonStyle(
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white10),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                DateTime.now().year.toString(),
                                                style: boldTextStyle(16),
                                              )),
                                        )
                                      ],
                                    ),
                                  ))
                              : Container(
                                  key: Key('2'),
                                ),
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 50, bottom: 25),
                    child: Text(
                      'AVAILABLE ASSESSMENTS',
                      style: boldTextStyle(20),
                    ),
                  ),

                  // render assessment widgets
                  for (var bodyAssessWidgets in bodyAssessList)
                    bodyAssessWidgets,
                  SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: WholeAppOutlinedButton(
                      text: 'VIEW ALL',
                      onPressed: () {},
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 47.0),
                          child: Text(
                            'RECOMMENDED',
                            style: boldTextStyle(20),
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 316),
                          child: Container(
                            height: double.infinity,
                            child: PageView.builder(
                              controller: pageController,
                              // itemCount: pages.length,
                              itemBuilder: (_, index) {
                                return Container();
                                // return pages[];
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: SmoothPageIndicator(
                              controller: pageController,
                              count: pages.length,
                              effect: ExpandingDotsEffect(
                                  activeDotColor: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ]),
                ],
              )),
            ));
      },
    );
  }
}
