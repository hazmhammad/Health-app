import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:whole/app/models/Artical.dart';
import 'package:whole/app/modules/articles/controllers/articles_controller.dart';
import 'package:whole/app/modules/onboarding/views/onboarding_view.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/app/widgets/widgets.dart';
import 'package:whole/constants/globals.dart';
import '../controllers/home_controller.dart';
import 'package:whole/constants/constants.dart';

class HomeView extends GetView<HomeController> {
  var percntage;

  final pageController =
      PageController(viewportFraction: 0.8, keepPage: false, initialPage: 0);

  buildArticalCard({required Article article}){
     return WholeAppArticleCard(
          article: article,);
  }


  @override
  Widget build(BuildContext context) {
    print("From Home");
    return GetBuilder<HomeController>(
      builder: (controller) {
        return WholeAppScaffold(
            title: 'Home',
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
              child: GetX<HomeController>(
                builder: (HomeController homeController){
                  return controller.isLoading == true ? Center(child: CircularProgressIndicator(),) :  Center(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30, bottom: 20),
                              child: Text(
                                'Your WHOLE Score',
                                style: boldTextStyle(25),
                              ),
                            ),
                            WholeAppCircularIndicator(
                              prcentage: homeController.score.first.total,
                              isLarge: true,
                              icon: Whole_icons.whole,
                            ),
                          ],
                        ),
                        BreakdownWidget(
                            height: Get.height * 0.65,
                            isExpanded: controller.expanded,
                            expand: controller.expand,
                            breakDownWidget: AnimatedSwitcher(
                              duration: Duration(seconds: 1),
                              child: controller.expanded
                                  ? Container(
                                  key: Key('1'),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 30.0),
                                          child: WholeAppStatWidget(
                                            icon: Whole_icons.person,
                                            percentage: homeController.score.first.score!.body,
                                            title: 'BODY',
                                            toPage: Routes.BODY,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 20.0),
                                          child: WholeAppStatWidget(
                                            icon: Whole_icons.sun,
                                            percentage: homeController.score.first.score!.mind,
                                            title: 'MIND',
                                            toPage: () {},
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 20.0),
                                          child: WholeAppStatWidget(
                                            icon: Whole_icons.person,
                                            percentage: homeController.score.first.score!.spirit,
                                            title: 'SPIRIT',
                                            toPage: () {},
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 20.0),
                                          child: WholeAppStatWidget(
                                            icon: Whole_icons.person,
                                            percentage: homeController.score.first.score!.environment,
                                            title: 'ENVIRONMENT',
                                            toPage: () {},
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, bottom: 20),
                                          child: WholeAppStatWidget(
                                            icon: Whole_icons.person,
                                            percentage: homeController.score.first.score!.ehr,
                                            title: 'ELECTRONIC HEALTH RECORD',
                                            toPage: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                                  : Container(
                                key: Key('2'),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, top: 50, bottom: 25),
                          child: Text(
                            'AVAILABLE ASSESSMENTS',
                            style: boldTextStyle(20),
                          ),
                        ),

                        // render assessment widgets
                        for (var assessmentWidget in assesmentList)
                          assessmentWidget,

                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 30.0, top: 47.0),
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
                                    child: GetX<ArticlesController>(
                                      builder: (ArticlesController articalController){
                                        return   articalController.articals.length != 0 ?  PageView.builder(
                                          controller: pageController,
                                          itemCount: articalController.articals.length,
                                          itemBuilder: (context, index) {
                                            print("Artical List:: ${articalController.articals[index].title}");

                                            return
                                              buildArticalCard(article: articalController.articals[index]);
                                          },
                                        ) : Center(child: Text("No articals puplished", style: TextStyle(color: Colors.white),));
                                      },
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: ArticlesController.to.articals.length != 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Center(
                                      child: SmoothPageIndicator(
                                        controller: pageController,
                                        count: 3,
                                        effect: ExpandingDotsEffect(
                                            activeDotColor: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 47),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 30.0, top: 27.0),
                                  child: Text(
                                    'EXPLORE',
                                    style: boldTextStyle(20),
                                  ),
                                ),
                                SizedBox(height: 27),
                              ]),
                        ),

                        // render explore widgets
                        for (var exploreWidget in exploreList) exploreWidget,
                      ],
                    ),
                  );
                },
              ),
            ));
      },
    );
  }
}
