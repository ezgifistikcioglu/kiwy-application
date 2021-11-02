import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';
import 'package:kiwy_app/core/init/widget/shape/custom_shape_border_top.dart';

import 'header_logo.dart';
import 'header_row.dart';

List<bool> isHovering = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kSecondarColor,
      shape: CustomShapeBorderTop(
          ScreenHelper.isMobile(context)
              ? curveHeightTopMobile
              : curveHeightTop,
          context),
      borderOnForeground: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ScreenHelper(
        web: Padding(
          padding: EdgeInsets.symmetric(vertical: getHeight(context) * 0.02),
          child: buildHeader(context),
        ),
        // We will make this in a bit
        mobile: buildMobileHeader(context),
        tablet: buildHeader(context),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: getHeight(context) * 0.02),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            HeaderLogo(),
            HeaderRow(),
          ],
        ),
      ),
    );
  }

  // mobile header
  Widget buildMobileHeader(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: getHeight(context) * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Center(child: HeaderLogo()),
          ],
        ),
      ),
    );
  }
}
