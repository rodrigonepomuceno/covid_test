import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final EdgeInsets padding;

  const AppDivider({Key key, this.height, this.width, this.color, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ?? EdgeInsets.zero,
      height: height,
      width: width,
      color: color ?? AppColors.gray,
    );
  }
}
