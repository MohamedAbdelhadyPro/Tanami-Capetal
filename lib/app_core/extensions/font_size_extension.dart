import 'package:flutter/material.dart';

import '../di/di.dart';
import '../routes/nav_service.dart';

extension FontSizeExtension on double {
  double get f => ResponsiveTextSize.getResponsiveTextSize(
      context: di<NavService>().navKey.currentContext!, fontSize: this);
}

class ResponsiveTextSize {
  static double _getScalFactor({required BuildContext context}) {
    double width = MediaQuery.sizeOf(context).width;
    if (width < 600) {
      return width / 400;
    } else if (width < 900) {
      return width / 700;
    } else {
      return width / 1000;
    }
  }

  static double getResponsiveTextSize(
      {required BuildContext context, required double fontSize}) {
    double scaleFactor = _getScalFactor(context: context);
    double responsiveFontSize = fontSize * scaleFactor;
    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }
}
