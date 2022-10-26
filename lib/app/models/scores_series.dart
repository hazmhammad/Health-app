import 'package:charts_flutter/flutter.dart' as charts;

class ScoresSeries {
  final String month;
  final int score;
  final charts.Color barColor;

  ScoresSeries({
    required this.month,
    required this.score,
    required this.barColor,
  });
}
