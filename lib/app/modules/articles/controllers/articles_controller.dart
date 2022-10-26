import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/models/Artical.dart';
import 'package:http/http.dart' as http;
import 'package:whole/app/models/userScore.dart';
import 'package:whole/app/modules/home/controllers/home_controller.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/preferences/user_preferences.dart';
import '../../../api/api_settings.dart';

class ArticlesController extends GetxController {
  //TODO: Implement ArticlesController

  static ArticlesController get to => Get.find();
  RxList<Article> articals = <Article>[].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("we are here");
    getArticalsPublished();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  Future<List<Article>> getArticalsPuplishedFromApi() async{

    print("TOKEN ::: ${UserPreferences().getToken()}");
    var url = Uri.parse(ApiSettings.INDEXARTICALPUBLISH,);

    var response = await http.get(url, headers: {
      "x-auth-token" : UserPreferences().getToken(),
    });
    print(response.statusCode);
    var jsonResponse  = jsonDecode(response.body);
  print(jsonResponse);
    if (response.statusCode == 200) {
      var jsonResponse  = jsonDecode(response.body) as List;
      print(response.statusCode);
      print(jsonResponse.runtimeType);
      List<Article> list = jsonResponse.map((e) =>Article.fromJson(e)).toList();
      return  list;
      }
    return [];
  }


  void getArticalsPublished() async{

   articals.value = await getArticalsPuplishedFromApi();

    // if(article != null){
    //   articals.add(article);
    // }
    print(articals.length);
  }

  Future updateScore({required String target, required int points}) async{

    print("TOKEN ::: ${UserPreferences().getToken()}");
    var url = Uri.parse(ApiSettings.UPDATESCORE,);

    var response = await http.patch(url, headers: {
      "x-auth-token" : UserPreferences().getToken(),
    },body: {
      "target": target,
      "points": points.toString()
    });
    print(response.statusCode);
    var jsonResponse  = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      print( HomeController.to.score.map((element) => element.score!.body));
      // var body  = jsonDecode(response.body)['body'];
      // var mind  = jsonDecode(response.body)['mind'];
      // var environment  = jsonDecode(response.body)['environment'];
      // var spirit  = jsonDecode(response.body)['spirit'];
      // var ehr  = jsonDecode(response.body)['ehr'];
      //
      // HomeController.to.score.forEach((element) => element.score!.body = body);
      // HomeController.to.score.forEach((element) => element.score!.mind = mind);
      // HomeController.to.score.forEach((element) => element.score!.ehr = ehr);
      // HomeController.to.score.forEach((element) => element.score!.spirit = spirit);
      // HomeController.to.score.forEach((element) => element.score!.environment = environment);
      var jsonResponse  = jsonDecode(response.body);
      List<UserScore> temp = [];
      temp.clear();
      print(jsonResponse);
    var score =  UserScore.fromJson(jsonResponse);
     temp.add(score);
      HomeController.to.score.value = temp;
      Get.snackbar("Success", "Added $points to $target" , backgroundColor: Colors.green);
   Future.delayed(Duration(milliseconds: 500), (){
     Get.offAndToNamed(Routes.HOME);

   });
    }else{
      Get.snackbar("Filed", "Not able to add points", backgroundColor: Colors.red);

    }
  }
}
