import 'package:get/get.dart';

class AddEditAllergiesController extends GetxController {
  var checkBool = false;
  var allergiesList = [
    {'name': 'Shallfish', 'type': 'Food', 'checked': false},
    {'name': 'Wheat', 'type': 'Food', 'checked': false},
    {'name': 'Cat', 'type': 'Pet', 'checked': true},
    {'name': 'Soy', 'type': 'Food', 'checked': false},
    {'name': 'Eggs', 'type': 'Food', 'checked': false},
    {'name': 'Pollen', 'type': 'Environmental', 'checked': false},
  ];

  Rx<List> foundAllergie = Rx<List>([]);

  void checkAllergie(List list) {
    update();
  }

  @override
  void onInit() {
    super.onInit();
    foundAllergie.value = allergiesList;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void filterAllregie(String title) {
    List results = [];

    if (title.isEmpty) {
      results = allergiesList;
    } else {
      results = allergiesList
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .contains(title.toLowerCase()))
          .toList();
    }
    foundAllergie.value = results;
    update();
  }
}
