import 'package:architech_todo/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets? padding;
  const TopContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.child,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: const BoxDecoration(
          color: AppColor.blue,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
