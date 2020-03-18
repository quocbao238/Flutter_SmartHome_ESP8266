

import 'package:flutter/material.dart';
import 'package:smarthome/UI/customs/sizeHelper.dart';

class CircleEnable extends StatelessWidget {
  const CircleEnable({
    Key key,
    @required this.height,
    @required this.color,
  }) : super(key: key);

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height * 0.15 / 10,
      height: height * 0.15 / 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius * 2), color: color),
    );
  }
}