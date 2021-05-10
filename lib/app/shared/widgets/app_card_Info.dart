import 'package:covid19/app/shared/widgets/app_sized_width.dart';
import 'package:flutter/material.dart';

class AppCardInfo extends StatelessWidget {
  const AppCardInfo({
    Key key,
    @required this.title,
    @required this.labelInfoDay,
    @required this.labelDayPrevious,
    @required this.color,
    @required this.percent,
  }) : super(key: key);

  final String title;
  final String labelInfoDay;
  final String labelDayPrevious;
  final String percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey.withOpacity(0.1),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    labelInfoDay,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: color,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        labelDayPrevious,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AppSizedWidth(value: 4),
                      Text(
                        '($percent%)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      AppSizedWidth(value: 10),
                      Text(
                        '24h',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: color,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
