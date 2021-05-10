import 'package:flutter/material.dart';

class AppSizedWidth extends StatelessWidget {
  const AppSizedWidth({
    Key key,
    @required this.value,
  }) : super(key: key);
  final double value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: value);
  }
}
