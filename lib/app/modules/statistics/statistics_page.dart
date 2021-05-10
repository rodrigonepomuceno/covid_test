import 'package:covid19/app/modules/statistics/statistics_controller.dart';
import 'package:covid19/app/modules/statistics/widgets/statistics_graphic.dart';
import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticsPage extends GetView<StatisticsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'statisticas'.tr,
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        centerTitle: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.black,
        ),
      ),
      body: Center(
        child: StatisticsGraphicPage(countryList: controller.countryList),
      ),
    );
  }
}
