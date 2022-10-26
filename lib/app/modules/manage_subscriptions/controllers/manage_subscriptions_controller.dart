import 'package:get/get.dart';

class ManageSubscriptionsController extends GetxController {
  var selectedChoice='';
  final List<String> radioCho = [
    'It’s too expensive',
    'I don’t have time to use the app',
    'Other (fill in reason below)'
  ];

  void onChangedChoice(var choice){
    selectedChoice = choice;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
