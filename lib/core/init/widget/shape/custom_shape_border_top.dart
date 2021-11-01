import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';

class CustomShapeBorderTop extends ContinuousRectangleBorder {
  final double curveHeight;
  final BuildContext context;
  const CustomShapeBorderTop(this.curveHeight, this.context);
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height -
          (ScreenHelper.isMobile(context)
              ? curveHeightTopMobile
              : curveHeightTop),
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}
