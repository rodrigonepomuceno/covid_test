import 'package:flutter/material.dart';

class AppSizedHeight extends StatelessWidget {
  const AppSizedHeight({
    Key key,
    @required this.value,
  }) : super(key: key);
  final double value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: value);
  }
}
