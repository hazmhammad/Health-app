import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/constants/constants.dart';

import '../app/widgets/widgets.dart';

const Map<String, dynamic> assessmentWidgets = {
  "bmi": {
    "color": KAccentGreen,
    "title": "BODY MASS INDEX",
    "toPage": Routes.BMI,
    "icon": Whole_icons.person
  },
  "stress": {
    "color": KFadedBlue,
    "title": "STRESS ASSESSMENT",
    "toPage": Routes.MAAP,
    "icon": Whole_icons.sun
  },
  "forgivness": {
    "color": kDarkGrey,
    "title": "FORGIVNESS",
    "toPage": "",
    "icon": Whole_icons.person
  },
  "wherelive": {
    "color": KMidBlue,
    "title": "WHERE I LIVE",
    "toPage": "",
    "icon": Whole_icons.person
  },
};
const Map<String, dynamic> exploreWidgets = {
  "body": {
    "color": KAccentGreen,
    "title": "BODY",
    "toPage": Routes.BODY,
    "icon": Whole_icons.person
  },
  "mind": {
    "color": KFadedBlue,
    "title": "MIND",
    "toPage": "",
    "icon": Whole_icons.sun
  },
  "spirit": {
    "color": kDarkGrey,
    "title": "SPIRIT",
    "toPage": "",
    "icon": Whole_icons.person
  },
  "environment": {
    "color": KMidBlue,
    "title": "ENVIRONMENT",
    "toPage": "",
    "icon": Whole_icons.person
  },
  "electronic": {
    "color": kDarkBlue,
    "title": "ELECTRONIC HEALTH RECORD",
    "toPage": Routes.HEALTH_RECORD,
    "icon": Whole_icons.person
  },
};

const Map<String, dynamic> bodyWidgetsList = {
  "electronic": {
    "color": KAccentGreen,
    "title": "BODY MASS INDEX",
    "toPage": "",
    "icon": Whole_icons.person
  },
  "chronic": {
    "color": KFadedBlue,
    "title": "CHRONIC DISEASE SCREEN",
    "toPage": Routes.CHRONIC,
    "icon": Whole_icons.sun
  },
  "general": {
    "color": kMidGray,
    "title": "GENERAL HEALTH",
    "toPage": "",
    "icon": Whole_icons.sun
  },
};

// genrate HomeView assessment widgets list
final assesmentList = List.generate(
    assessmentWidgets.length,
    (index) => WholeAppAssessmentWidget(
          color: assessmentWidgets.values.elementAt(index)['color'],
          title: assessmentWidgets.values.elementAt(index)['title'],
          icon: assessmentWidgets.values.elementAt(index)['icon'],
          toPage: assessmentWidgets.values.elementAt(index)['toPage'],
        ));

// genrate HomeView explore widgets list
final exploreList = List.generate(
    exploreWidgets.length,
    (index) => WholeAppAssessmentWidget(
          color: exploreWidgets.values.elementAt(index)['color'],
          title: exploreWidgets.values.elementAt(index)['title'],
          icon: exploreWidgets.values.elementAt(index)['icon'],
          toPage: exploreWidgets.values.elementAt(index)['toPage'],
        ));

// genrate BodyView explore widgets list
final bodyAssessList = List.generate(
    bodyWidgetsList.length,
    (index) => WholeAppAssessmentWidget(
          color: bodyWidgetsList.values.elementAt(index)['color'],
          title: bodyWidgetsList.values.elementAt(index)['title'],
          icon: bodyWidgetsList.values.elementAt(index)['icon'],
          toPage: bodyWidgetsList.values.elementAt(index)['toPage'],
        ));
