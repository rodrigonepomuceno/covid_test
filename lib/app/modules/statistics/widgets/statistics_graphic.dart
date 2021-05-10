import 'package:covid19/app/shared/models/contry_models.dart';
import 'package:covid19/app/shared/models/statistics_model.dart';
import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:covid19/app/shared/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StatisticsGraphicPage extends StatelessWidget {
  final List<CountryModel> countryList;
  const StatisticsGraphicPage({
    Key key,
    @required this.countryList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
    String order = '';

    var recovered = [
      GraphInformationModel('', 0, AppColors.black),
    ];

    var deaths = [
      GraphInformationModel('', 0, AppColors.gray),
    ];

    var active = [
      GraphInformationModel('', 0, AppColors.gray),
    ];

    var confirmed = [
      GraphInformationModel('', 0, AppColors.gray),
    ];

    recovered = _addRecovered(order: order, graphInformation: recovered);
    deaths = _addDeaths(order: order, graphInformation: deaths);
    active = _addActive(order: order, graphInformation: active);
    confirmed = _addConfirmed(order: order, graphInformation: confirmed);

    var series = [
      charts.Series(
        domainFn: (GraphInformationModel clickData, _) => clickData.date,
        measureFn: (GraphInformationModel clickData, _) => clickData.qty,
        colorFn: (GraphInformationModel clickData, _) => clickData.color,
        id: 'recovered'.tr,
        data: recovered,
      ),
      charts.Series(
        domainFn: (GraphInformationModel clickData, _) => clickData.date,
        measureFn: (GraphInformationModel clickData, _) => clickData.qty,
        colorFn: (GraphInformationModel clickData, _) => clickData.color,
        id: 'active'.tr,
        data: active,
      ),
      charts.Series(
        domainFn: (GraphInformationModel clickData, _) => clickData.date,
        measureFn: (GraphInformationModel clickData, _) => clickData.qty,
        colorFn: (GraphInformationModel clickData, _) => clickData.color,
        id: 'confirmed'.tr,
        data: confirmed,
      ),
      charts.Series(
        domainFn: (GraphInformationModel clickData, _) => clickData.date,
        measureFn: (GraphInformationModel clickData, _) => clickData.qty,
        colorFn: (GraphInformationModel clickData, _) => clickData.color,
        id: 'deaths'.tr,
        data: deaths,
      )..setAttribute(
          charts.measureAxisIdKey,
          secondaryMeasureAxisId,
        ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
      vertical: true,
      behaviors: [
        new charts.SlidingViewport(),
        new charts.PanAndZoomBehavior(),
        new charts.SeriesLegend(
          position: charts.BehaviorPosition.bottom,
          outsideJustification: charts.OutsideJustification.start,
          cellPadding: EdgeInsets.only(top: 15, right: 15),
          entryTextStyle: charts.TextStyleSpec(fontSize: 13),
        ),
      ],
      domainAxis: new charts.OrdinalAxisSpec(
        viewport: new charts.OrdinalViewport('', 4),
        renderSpec: new charts.SmallTickRendererSpec(
          labelRotation: 50,
          labelStyle: charts.TextStyleSpec(fontSize: 11),
          minimumPaddingBetweenLabelsPx: 5,
        ),
      ),
    );

    var chartWidget = Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: 500,
        child: chart,
      ),
    );

    return chartWidget;
  }

  _addRecovered({String order, List<GraphInformationModel> graphInformation}) {
    if (countryList.length > 0) {
      graphInformation.clear();
      countryList.forEach(
        (item) => graphInformation.add(
          GraphInformationModel(
            AppFormatters.dateFormatting2(item.date),
            item.recovered,
            AppColors.appGreen,
          ),
        ),
      );
    }
    return graphInformation;
  }

  _addDeaths({String order, List<GraphInformationModel> graphInformation}) {
    if (countryList.length > 0) {
      graphInformation.clear();
      countryList.forEach(
        (item) => graphInformation.add(
          GraphInformationModel(
            AppFormatters.dateFormatting2(item.date),
            item.deaths,
            AppColors.appRed,
          ),
        ),
      );
    }
    return graphInformation;
  }

  _addActive({String order, List<GraphInformationModel> graphInformation}) {
    if (countryList.length > 0) {
      graphInformation.clear();
      countryList.forEach(
        (item) => graphInformation.add(
          GraphInformationModel(
            AppFormatters.dateFormatting2(item.date),
            item.active,
            AppColors.appOrange,
          ),
        ),
      );
    }
    return graphInformation;
  }

  _addConfirmed({String order, List<GraphInformationModel> graphInformation}) {
    if (countryList.length > 0) {
      graphInformation.clear();
      countryList.forEach(
        (item) => graphInformation.add(
          GraphInformationModel(
            AppFormatters.dateFormatting2(item.date),
            item.confirmed,
            AppColors.appBlue,
          ),
        ),
      );
    }
    return graphInformation;
  }
}
