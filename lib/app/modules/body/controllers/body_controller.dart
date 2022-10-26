import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whole/app/models/scores_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:whole/constants/style.dart';

class BodyController extends GetxController {
  //TODO: Implement BodyController
  var expanded = false;
  var percntage = 0;

  final List<ScoresSeries> data = [
    ScoresSeries(
        month: 'Jan.',
        score: 30,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'Feb.',
        score: 17,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'Mar.',
        score: 13,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'Apr.',
        score: 70,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'May.',
        score: 13,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'Jun.',
        score: 13,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'Jul.',
        score: 13,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'Aug.',
        score: 13,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'Sep',
        score: 0,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'Oct.',
        score: 14,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'Nov.',
        score: 8,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
    ScoresSeries(
        month: 'Dec.',
        score: 2,
        barColor: charts.ColorUtil.fromDartColor(KAccentGreen)),
  ];

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
  void expand() {
    expanded = !expanded;
    update();
  }
}
