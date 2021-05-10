import 'package:covid19/app/shared/themes/app_colors.dart';
import 'package:covid19/app/shared/widgets/app_divider.dart';
import 'package:flutter/material.dart';

class AppListTile extends StatelessWidget {
  final Widget leading;
  final Widget body;
  final Widget trailing;
  final bool hasBotDivider;
  final Color backgroundColor;
  final Function onTap;
  final double height;
  final double horizontalPadding;
  final double botDividerHeight;
  final Color botDividerCollor;

  const AppListTile({
    Key key,
    this.leading,
    this.body,
    this.trailing,
    this.backgroundColor,
    this.onTap,
    this.height,
    this.horizontalPadding,
    this.hasBotDivider = false,
    this.botDividerHeight = 1,
    this.botDividerCollor = AppColors.gray,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        color: backgroundColor ?? AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: horizontalPadding ?? 16,
                  right: horizontalPadding ?? 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leading != null)
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: leading,
                    ),
                  Expanded(child: body ?? Container()),
                  if (trailing != null)
                    Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: trailing,
                    ),
                ],
              ),
            ),
            if (hasBotDivider)
              AppDivider(
                color: botDividerCollor,
                height: botDividerHeight,
              ),
          ],
        ),
      ),
    );
  }
}
