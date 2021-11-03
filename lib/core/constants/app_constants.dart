import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(255, 183, 3, 1);
const Color kSecondaryColor = Color.fromRGBO(96, 108, 56, 1);
const Color kSecondarColor = Color.fromRGBO(40, 54, 24, 1);
const Color kBackgroundColor = Color.fromRGBO(196, 128, 4, 1);
const Color kPinkColor = Color.fromRGBO(113, 63, 71, 1);
const Color kDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);
const Color kBlackColor = Color.fromRGBO(0, 0, 0, 1);
const Color kGrayColor = Color.fromRGBO(163, 177, 187, 1);

/// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
const double curveHeightDown = 20.0;
const double curveHeightTop = 45.0;
const double curveHeightDownMobile = 15.0;
const double curveHeightTopMobile = 20.0;

/// Strings
const String introText = "The Magic Power of Tea and Capsule";
const String emailHintText = "your@gmail.com";
const String emailLabelText = "Email";
const String subscribeText = "SUBSCRIBE";
const String newsletterText1 = "GET 10% OFF";
const String newsletterText2 =
    "Subscribe to be the first to know when it comes to Kiwy's latest news, deals, and special offers when it comes to everything new.";
const String newsletterText3 =
    "(Enter your email and get 10% off your first order!)";

/// MediaQuery
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * 0.5;

double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

/// SizedBox
SizedBox get sizedBoxFive => const SizedBox(height: 5);
SizedBox get sizedBoxTwenty => const SizedBox(height: 20);

/// Repetitive
BoxShadow emailContainerBoxShadow(Color color) =>
    BoxShadow(color: color, offset: const Offset(0, 8), blurRadius: 8);

TextStyle textStyleForEmailBox({double? fontSize, Color? color}) =>
    TextStyle(fontSize: fontSize, color: color);
TextStyle newsletterTextStyle(Color? color, double? fontSize,
        FontStyle? fontStyle, FontWeight? fontWeight) =>
    TextStyle(
        color: color,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight ?? FontWeight.normal);
Widget createIcon(IconData? icon, Color color, {double? size}) => Icon(
      icon,
      color: color,
      size: size ?? 24.0,
    );
EdgeInsetsGeometry smallPadding(BuildContext context) =>
    EdgeInsets.only(top: getHeight(context) * 0.01);
