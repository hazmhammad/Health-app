import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:whole/app/models/scores_series.dart';

class WholeAppScoresChart extends StatelessWidget {
  final List<ScoresSeries> data;
  const WholeAppScoresChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ScoresSeries, String>> series = [
      charts.Series(
        id: 'Scores',
        data: data,
        domainFn: (ScoresSeries series, _) => series.month,
        measureFn: (ScoresSeries series, _) => series.score,
        colorFn: (ScoresSeries series, _) => series.barColor,
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
      primaryMeasureAxis: const charts.NumericAxisSpec(
          tickProviderSpec: charts.BasicNumericTickProviderSpec(
            desiredTickCount: 6,
          ),
          viewport: charts.NumericExtents(0, 100),
          renderSpec: charts.GridlineRendererSpec(
            labelStyle: charts.TextStyleSpec(
                fontSize: 14, // size in Pts.
                fontFamily: "Roboto",
                color: charts.MaterialPalette.white),
          )),

      // styling the bar
      domainAxis: const charts.OrdinalAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
        labelStyle: charts.TextStyleSpec(
            fontSize: 14,
            fontFamily: "Roboto", // size in Pts.
            color: charts.MaterialPalette.white),
        lineStyle: LineStyleSpec(color: charts.MaterialPalette.transparent),
        labelAnchor: TickLabelAnchor.after,
        labelJustification: TickLabelJustification.outside,
      )),

      // add click listener to the bars
      selectionModels: [
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: (model) {
            // click event here
          },
          updatedListener: (model) {
            print('updatedListener in $model');
          },
        ),
      ],
    );
  }
}
