import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/modules/home/views/home_view.dart';
import 'package:whole/app/modules/profile/controllers/profile_controller.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/constants/style.dart';

class WholeAppDrawer extends StatelessWidget {
  const WholeAppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 81, 77, 96),
      child: ListView(
        children: [
          Container(
            height: 100.0,
            child: DrawerHeader(
              margin: EdgeInsets.all(0.0),
              child: GetX<ProfileController>(
                builder: (ProfileController  controller){
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/avatar.png"),
                          radius: 35,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          border: Border.all(color: Colors.white, width: 1.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.profile.first.name ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                                  overlayColor:
                                  MaterialStateProperty.all(Colors.white10),
                                ),
                                onPressed: () {
                                  Get.back();
                                  Get.toNamed(Routes.PROFILE);
                                },
                                child: Text(
                                  'View Profile',
                                  style: underlineRegularTextStyle(16),
                                ))
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          ListTile(
            selectedTileColor: KAccentGreen,
            selectedColor: Colors.white,
            selected: Get.currentRoute == Routes.HOME ? true : false,
            title: Text(
              "Home",
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
            leading: Icon(
              Icons.home,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {
              Get.offAllNamed(Routes.HOME);
            },
          ),
          ListTile(
            title: Text(
              "Body",
              style: TextStyle(fontSize: 16.0),
            ),
            selectedTileColor: KAccentGreen,
            selectedColor: Colors.white,
            textColor: Colors.white,
            selected: Get.currentRoute == Routes.BODY ? true : false,
            leading: Icon(
              Icons.boy_rounded,
              color: Colors.white,
              size: 35.0,
            ),
            onTap: () {
              Get.back();
              Get.toNamed(Routes.BODY);
            },
          ),
          ListTile(
            title: Text(
              "Mind",
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
            leading: Icon(
              Icons.sunny,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Spirit",
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
            leading: Icon(
              Icons.handshake_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Environment",
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
            leading: Icon(
              Icons.gesture_outlined,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {},
          ),
          ListTile(
            selectedTileColor: KAccentGreen,
            selectedColor: Colors.white,
            selected: Get.currentRoute == Routes.HEALTH_RECORD ? true : false,
            title: Text(
              "My Health Record",
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
            leading: Icon(
              Icons.health_and_safety_outlined,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {
              Get.back();
              Get.toNamed(Routes.HEALTH_RECORD);
            },
          ),
          ListTile(
            title: Text(
              "My Badges",
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
            leading: Icon(
              Icons.circle,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Available Assessments",
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
            leading: Icon(
              Icons.bar_chart,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Recommended Activities",
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
            leading: Icon(
              Icons.rule_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "FAQs",
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
            leading: Icon(
              Icons.question_mark_outlined,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 16.0),
            ),
            textColor: Colors.white,
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30.0,
            ),
            onTap: () {
              Get.back();
              Get.toNamed(Routes.SETTINGSPAGE);
            },
          ),
        ],
      ),
    );
  }
}
