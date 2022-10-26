import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:whole/constants/constants.dart';
import 'package:whole/preferences/user_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().initPreferences();

  //Smooth transition color for LinearGradient
  Paint.enableDithering = true;

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // theme: ThemeData(brightness: Brightness.dark),
      theme: primaryTheme(),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
