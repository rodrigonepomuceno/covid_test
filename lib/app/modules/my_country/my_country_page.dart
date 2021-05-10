import 'package:covid19/app/shared/widgets/app_date_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:covid19/app/shared/utils/behaviour.dart';
import 'package:covid19/app/shared/widgets/app_card_Info.dart';
import 'package:covid19/app/shared/widgets/app_header_info.dart';
import 'package:covid19/app/shared/widgets/app_sized_height.dart';
import 'package:covid19/app/modules/my_country/my_country_controller.dart';
import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:covid19/app/shared/utils/formatters.dart';

class MyCountryPage extends GetView<MyCountryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(
        () => SafeArea(
          child: controller.pageState.value == Behaviour.regular
              ? controller.myCountryList.length > 0
                  ? ListView(
                      children: [
                        AppSizedHeight(value: 30),
                        AppHeaderInfo(
                          country: controller
                              .myCountryList[controller.initIndex.value]
                              .country,
                          flag: controller.getFlagCountryList(),
                          riskOfContagion: controller.riskOfContagion.value.tr,
                          riskOfContagionColor:
                              controller.riskOfContagionColor.value,
                          onTapSahre: () => controller.onTap(context),
                          onTapStatistics: controller.onTapStatitics,
                        ),
                        AppSizedHeight(value: 25),
                        AppDateDetail(
                          date: AppFormatters.dateFormatting(controller
                              .myCountryList[controller.initIndex.value].date),
                          incDay: controller.incDay,
                          subDay: controller.subDay,
                        ),
                        AppSizedHeight(value: 5),
                        AppCardInfo(
                          color: AppColors.appOrange,
                          title: 'active'.tr,
                          labelInfoDay: controller
                              .myCountryList[controller.initIndex.value].active
                              .toString(),
                          labelDayPrevious: controller
                              .differenceActiveBetweenDays.value
                              .toString(),
                          percent: controller.percentActive.value.toString(),
                        ),
                        AppSizedHeight(value: 10),
                        AppCardInfo(
                          color: AppColors.appBlue,
                          title: 'confirmed'.tr,
                          labelInfoDay: controller
                              .myCountryList[controller.initIndex.value]
                              .confirmed
                              .toString(),
                          labelDayPrevious: controller
                              .differenceConfirmedBetweenDays.value
                              .toString(),
                          percent: controller.percentConfirmed.value.toString(),
                        ),
                        AppSizedHeight(value: 10),
                        AppCardInfo(
                          color: AppColors.appGreen,
                          title: 'recovered'.tr,
                          labelInfoDay: controller
                              .myCountryList[controller.initIndex.value]
                              .recovered
                              .toString(),
                          labelDayPrevious: controller
                              .differenceRecoveredBetweenDays.value
                              .toString(),
                          percent: controller.percentRecovered.value.toString(),
                        ),
                        AppSizedHeight(value: 10),
                        AppCardInfo(
                          color: AppColors.appRed,
                          title: 'deaths'.tr,
                          labelInfoDay: controller
                              .myCountryList[controller.initIndex.value].deaths
                              .toString(),
                          labelDayPrevious: controller
                              .differenceDeathsBetweenDays.value
                              .toString(),
                          percent: controller.percentDeaths.value.toString(),
                        ),
                      ],
                    )
                  : Container()
              : controller.pageState.value == Behaviour.error
                  ? Center(
                      child: Text('Error'),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
      ),
    );
  }
}
