import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:whole/app/widgets/whole_app_scaffold.dart';
import 'package:whole/constants/constants.dart';

import '../../../routes/app_pages.dart';
import '../controllers/settingspage_controller.dart';

class SettingspageView extends GetView<SettingspageController> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return WholeAppScaffold(
      hasAppBar: true,
      title: "Settings",
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 100.0),
                ),
                Text(
                  "Allow Notifications?",
                  style: boldTextStyle(20),
                ),
                SizedBox(
                  width: 100,
                ),
                FlutterSwitch(
                  value: status,
                  onToggle: (val) {
                    //TODO: Add functionality
                  },
                  width: 56.0,
                  height: 32.0,
                  activeColor: KAccentGreen,
                )
              ],
            ),
            Divider(
              color: kGrayishWhite,
              thickness: 2.0,
              height: 1.0,
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                ),
                Text(
                  "Linked Devices and Apps",
                  style: boldTextStyle(20),
                ),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                ),
                Text(
                  "Avaiable Apps",
                  style: boldTextStyle(16),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: kGrayishWhite,
              thickness: 0.5,
              height: 20.0,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                ),
                Image.asset(
                  iSamsungHealth,
                  width: 23.86,
                  height: 24.86,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  "Samsung Health",
                  style: regularTextStyle(18),
                ),
                SizedBox(
                  width: 107,
                ),
                FlutterSwitch(
                  value: status,
                  onToggle: (val) {
                    //TODO: Add functionality
                  },
                  width: 56.0,
                  height: 32.0,
                  activeColor: KAccentGreen,
                ),
              ],
            ),
            Divider(
              color: kGrayishWhite,
              thickness: 0.5,
              height: 30.0,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                ),
                Image.asset(
                  iFitBit,
                  width: 23.86,
                  height: 24.86,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  "FitBit",
                  style: regularTextStyle(18),
                ),
                SizedBox(
                  width: 198,
                ),
                FlutterSwitch(
                  value: status,
                  onToggle: (val) {
                    //TODO: Add functionality
                  },
                  width: 56.0,
                  height: 32.0,
                  activeColor: KAccentGreen,
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Divider(
              color: kGrayishWhite,
              thickness: 2.0,
              height: 1.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.MANAGE_SUBSCRIPTIONS);
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                  ),
                  Text(
                    "Manage Subscription",
                    style: boldTextStyle(20),
                  ),
                  SizedBox(
                    width: 110.0,
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: 40.0,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Divider(
              color: kGrayishWhite,
              thickness: 2.0,
              height: 1.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                ),
                TextButton(
                  onPressed: () {
                    //TODO: Add functionality
                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
