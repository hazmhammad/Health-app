import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/modules/MAAP/Models/Data.dart';
import 'package:whole/app/modules/MAAP/controllers/maap_result_controller.dart';
import 'package:whole/app/modules/MAAP/views/maap_result_view.dart';
import 'package:whole/constants/style.dart';

import '../Models/Questions.dart';

class MaapController extends GetxController {
  //TODO: Implement MaapController

  List<Question> _questions = sample_data
      .map((question) => Question(
          id: question['id'],
          question: question['question'],
          options: question['options']))
      .toList();

  List<Question> get questions => this._questions;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  bool _isFinished = false;
  bool get isFinished => this._isAnswered;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _result = 0;
  int get result => this._result;

  Icon _optionIcon = Icon(Icons.circle_outlined, size: 30, color: KAccentGreen);
  Icon get optionIcon => this._optionIcon;

  String _buttonText = "NEXT";
  String get buttonText => this._buttonText;

  @override
  void onInit() {
    _pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _pageController.dispose();
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    } else {
      //go to result page
      _pageController = PageController(initialPage: 0);
    }
  }

  void updateQuestionNumber(int index) {
    _questionNumber.value = index + 1;
    update();
  }

  void goToResult(int index) {
    if (index == 14) {
      _isFinished = true;
      _buttonText = "SUBMIT";
      Get.to(MaapResultView());

      update();
    } else {
      _buttonText = "NEXT";
      _isFinished = false;
      pageController.nextPage(
          duration: Duration(milliseconds: 150), curve: Curves.easeIn);
      update();
    }
  }
}
