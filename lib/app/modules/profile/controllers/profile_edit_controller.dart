import 'dart:convert';

import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/models/states.dart';
import 'package:whole/app/modules/MAAP/Models/countries.dart';
import 'package:whole/app/routes/app_pages.dart';
import 'package:whole/preferences/user_preferences.dart';

import '../../../api/api_settings.dart';
import 'package:http/http.dart' as http;
class ProfileEditController extends GetxController {
  //TODO: Implement ProfileEditController

  static ProfileEditController get to => Get.find();
  final count = 0.obs;
  GlobalKey<FormState> updateProfileKey= GlobalKey<FormState>();
 late TextEditingController firstNameController, surNameController,
     dayOfBirthController, yearOfBirthController, countryController, stateController,
     mobileNumberController;
  String? selectedItem = "Item 1";
  // List<String> countries = ["Country 1", "Country 2"];
  // List<String> states = ["State 1", "State 2"];
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  RxString selectedMonth = "".obs;
  RxString selectedCounrty = "".obs;
  RxString selectedState = "".obs;

  RxList<Countries> countries = <Countries>[].obs;
  RxList<States> states = <States>[].obs;
  @override
  void onInit() {
    super.onInit();
    selectedMonth.value = "";
    selectedCounrty.value = "";
    selectedState.value = "";
    firstNameController = TextEditingController();
    surNameController = TextEditingController();
    mobileNumberController = TextEditingController();
    dayOfBirthController = TextEditingController();
    yearOfBirthController = TextEditingController();
    countryController = TextEditingController();
    stateController = TextEditingController();
    getCountries();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    surNameController.dispose();
    mobileNumberController.dispose();
    dayOfBirthController.dispose();
    yearOfBirthController.dispose();
    countryController.dispose();
    stateController.dispose();
  }
  void increment() => count.value++;

  String? validateAllField(String value) {
    if (value.length == 0) {
      return "This filed should't blank";
    }
    return null;
  }

  bool checkUpdateProfileForm() {
    final isValid = updateProfileKey.currentState!.validate();
    print(isValid);
    if (!isValid) {
      print("not valid");
      return false;
    }else{
      updateProfileKey.currentState!.save();
      updateProfile();
      return true;
    }

    // saveToShared();
  }

  Future<bool>  updateProfile() async{
    var url = Uri.parse(ApiSettings.UPDATEPROFILE);
    var response = await http.put(url, body: {
      "name":  firstNameController.text,
      "surname" :  surNameController.text,
      "country" :  selectedCounrty,
      "state" :  selectedState,
      "jobDescription": "jobDescription",
      "mobilenumber" :  mobileNumberController.text,
      "birthdate" :  dayOfBirthController.text + "-" + selectedMonth.value + "-" +  yearOfBirthController.text,
    },
      headers: {
      "x-auth-token" : UserPreferences().getToken(),
      }
    );
    print(response.statusCode);
    if(response.statusCode == 200){
      var jsonResponse  = response.body;

      print(jsonResponse);
      Get.snackbar("Success", "Update profile Success", backgroundColor: Colors.green);
      Get.toNamed(Routes.PROFILE);
      return true;
    }else{
      Get.snackbar("Filed",response.body
      , backgroundColor: Colors.red);
      return false;
    }
  }

  Future<List<Countries>> getCountriesFromApi() async{

    var url = Uri.parse(ApiSettings.COUNTRIES,);

    var response = await http.get(url);
    print(response.statusCode);
   var jsonResponse  = jsonDecode(response.body);
    print(jsonResponse.runtimeType);
    print(jsonResponse);
    if (response.statusCode == 200) {
      var jsonResponse  = jsonDecode(response.body) as List;
      print(response.statusCode);
      List<Countries> list = jsonResponse.map((e) =>Countries.fromJson(e)).toList();
      return list;
    }
    return [];
  }


  void getCountries() async{

 countries.value  = await getCountriesFromApi();
    print(countries.length);
  }


  Future<List<States>> getStatesFromApi({required String isoCode}) async{

    var url = Uri.parse(ApiSettings.STATES + isoCode,);
print(url);
    var response = await http.get(url);
    print(response.statusCode);
    var jsonResponse  = jsonDecode(response.body);
    print(jsonResponse.runtimeType);
    print(jsonResponse);
    if (response.statusCode == 200) {
      var jsonResponse  = jsonDecode(response.body) as List;
      print(response.statusCode);
      List<States> list = jsonResponse.map((e) =>States.fromJson(e)).toList();
      return list;
    }
    return [];
  }


  void getStates({required String isoCode}) async{

    states.value  = await getStatesFromApi(isoCode: isoCode);
    print(countries.length);
  }
}
