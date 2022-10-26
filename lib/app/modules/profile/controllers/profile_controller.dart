import 'dart:convert';

import 'package:get/get.dart';
import 'package:whole/app/models/userProfile.dart';
import 'package:whole/preferences/user_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../api/api_settings.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  RxList<UserProfile> profile = <UserProfile>[].obs;
  RxBool isLoading = true.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<UserProfile?> getUserProfileFromApi() async{

    print("TOKEN ::: ${UserPreferences().getToken()}");
    var url = Uri.parse(ApiSettings.GETPROFILEUSER,);

    var response = await http.get(url, headers: {
      "x-auth-token" : UserPreferences().getToken(),
    });
    print(response.statusCode);
    var jsonResponse  = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      var jsonResponse  = jsonDecode(response.body);
      print(response.statusCode);
      return UserProfile.fromJson(jsonResponse);
    }
    return null;
  }


  void getUserProfile() async{

    isLoading.value = true;
    UserProfile? userProfile = await getUserProfileFromApi();

    if(userProfile != null){
      if(!profile.contains(userProfile)){
        profile.add(userProfile);
        isLoading.value = false;
      }
    }
    print(profile.length);
  }
}
