import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDateDetail extends StatelessWidget {
  const AppDateDetail({
    Key key,
    @required this.subDay,
    @required this.incDay,
    @required this.date,
  }) : super(key: key);

  final Function subDay;
  final Function incDay;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: subDay,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '-',
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.appOrange,
                  ),
                ),
              ),
            ),
          ),
          Text(
            '${'data_updated_on'.tr} $date',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.appOrange,
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: incDay,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '+',
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.appOrange,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
