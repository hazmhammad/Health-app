import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole/app/models/userScore.dart';
import 'package:whole/app/modules/articles/controllers/articles_controller.dart';
import 'package:whole/app/modules/profile/controllers/profile_controller.dart';

import '../../../../preferences/user_preferences.dart';
import '../../../api/api_settings.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {

  //TODO: Implement HomeController

static HomeController get to => Get.find();
  var expanded = false;
  RxBool isLoading = true.obs;
  RxList<UserScore> score = <UserScore>[].obs;
  void expand() {
    expanded = !expanded;
    update();
  }

  @override
  void onInit() async{
    Get.put(ArticlesController());
    Get.put(ProfileController());
    getUserScore();
   super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }


  Future<UserScore?> getUserScoreFromApi() async{
isLoading.value = true;
    print(UserPreferences().getToken());
    var url = Uri.parse(ApiSettings.USERSCORE,);

    var response = await http.get(url, headers: {
      "x-auth-token" : UserPreferences().getToken(),
    });
    print(response.statusCode);
    var jsonResponse  = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      var jsonResponse  = jsonDecode(response.body);
      print(response.statusCode);
      isLoading.value = false;

      print(isLoading);
      return UserScore.fromJson(jsonResponse);
    }
isLoading.value = false;

return null;
  }


  void getUserScore() async{

    UserScore? userScore = await getUserScoreFromApi();

    if(userScore != null){
      if(!score.contains(userScore)){
        score.add(userScore);
      }
    }



    print(score.length);
  }
}
