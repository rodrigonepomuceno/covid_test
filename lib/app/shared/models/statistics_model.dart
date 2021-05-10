import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GraphInformationModel {
  final String date;
  final int qty;
  final charts.Color color;

  GraphInformationModel(this.date, this.qty, Color color)
      : this.color = charts.Color(
          r: color.red,
          g: color.green,
          b: color.blue,
          a: color.alpha,
        );
}
