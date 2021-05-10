import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:covid19/app/shared/widgets/app_sized_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppHeaderInfo extends StatelessWidget {
  const AppHeaderInfo({
    Key key,
    @required this.country,
    @required this.flag,
    @required this.riskOfContagion,
    @required this.riskOfContagionColor,
    @required this.onTapSahre,
    @required this.onTapStatistics,
  }) : super(key: key);

  final Color riskOfContagionColor;
  final String flag;
  final String country;
  final String riskOfContagion;
  final Function onTapSahre;
  final Function onTapStatistics;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      height: 115,
      color: riskOfContagionColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$flag $country',
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 30,
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: onTapSahre,
                  child: Icon(
                    Icons.share,
                    color: AppColors.white,
                  ),
                ),
                AppSizedWidth(value: 20),
                Expanded(
                  child: Text(
                    '${'risk'.tr} $riskOfContagion',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AppSizedWidth(value: 20),
                InkWell(
                  onTap: onTapStatistics,
                  child: Icon(
                    Icons.graphic_eq,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
