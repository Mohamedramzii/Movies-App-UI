// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:flutter/material.dart';

class Blur_Container extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const Blur_Container({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 207, sigmaY: 207),
        child: SizedBox(
          width: width,
          height: height,
        ),
      ),
    );
  }
}
