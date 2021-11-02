import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';

class ScreenHelper extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget web;

  const ScreenHelper(
      {Key? key, required this.web, required this.mobile, required this.tablet})
      : super(key: key);

  static bool isMobile(BuildContext context) => getWidth(context) < 800.0;

  static bool isTablet(BuildContext context) =>
      getWidth(context) >= 800.0 && getWidth(context) < 1200.0;

  static bool isDesktop(BuildContext context) => getWidth(context) >= 1200.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 1200.0) {
          return web;
        } else if (constraints.maxWidth >= 800 &&
            constraints.maxWidth < 1200.0) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
