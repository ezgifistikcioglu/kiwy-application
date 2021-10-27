import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(255, 183, 3, 1);
const Color kSecondaryColor = Color.fromRGBO(96, 108, 56, 1);
const Color kSecondarColor = Color.fromRGBO(40, 54, 24, 1);
const Color kBackgroundColor = Color.fromRGBO(113, 63, 71, 1);
const Color kDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);
const Color kBlackColor = Color.fromRGBO(0, 0, 0, 1);

/// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * 0.5;

/// Strings
const curveHeight = 30.0;
