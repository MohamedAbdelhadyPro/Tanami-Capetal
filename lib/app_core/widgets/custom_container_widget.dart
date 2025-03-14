import 'package:flutter/material.dart';

import '../style/colors/colors.dart';

class CustomContainerWidget extends StatelessWidget {
  CustomContainerWidget(
      {super.key,
      this.child,
      this.margin,
      this.padding,
      this.radius,
      this.height,
      this.width,
      this.color});
  Widget? child;
  EdgeInsets? margin;
  EdgeInsets? padding;
  double? radius;
  double? height;
  double? width;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        borderRadius: BorderRadius.circular(radius ?? 16),
        border: Border.all(
          width: 1,
          color: AppColors.border,
        ),
      ),
      child: child,
    );
  }
}
