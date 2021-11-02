import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';

import 'email_box.dart';

class Newsletter extends StatelessWidget {
  const Newsletter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context) * 0.5,
      child: ScreenHelper.isMobile(context)
          ? Stack(fit: StackFit.expand, children: [
              newsletterImageMobile(context),
              newsletterTextForMobile(context)
            ])
          : Stack(
              fit: StackFit.expand,
              children: [newsletterImage(context), newsletterText(context)],
            ),
    );
  }

  /// Add newsletter Image
  Widget newsletterImage(BuildContext context) {
    return FractionallySizedBox(
        alignment: Alignment.centerRight, //to keep images aligned to right
        widthFactor: .61, //covers about 61% of the screen width
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/clover.png',
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/lemon.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ));
  }

  /// Add newsletter Image
  Widget newsletterImageMobile(BuildContext context) {
    return FractionallySizedBox(
        alignment: Alignment.centerRight, //to keep images aligned to right
        widthFactor: .50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/lemon.png',
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/clover.png',
              ),
            ),
          ],
        ));
  }

  /// Add newsletter texts
  Widget newsletterText(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: .49,
      child: Padding(
        padding: EdgeInsets.only(left: getWidth(context) * 0.05, right: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createIcon(Icons.filter_vintage_sharp, kGrayColor, size: 80),
            Text(newsletterText1,
                style: newsletterTextStyle(kSecondaryColor, 60, null, null)),
            sizedBoxTwenty,
            Text(newsletterText2,
                style:
                    newsletterTextStyle(kGrayColor, 23, null, FontWeight.bold)),
            sizedBoxTwenty,
            Text(newsletterText3,
                style: newsletterTextStyle(
                    kSecondaryColor, 22, FontStyle.italic, null)),
            sizedBoxTwenty,
            const EmailBox()
          ],
        ),
      ),
    );
  }

  Widget newsletterTextForMobile(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: .75,
      child: Padding(
        padding: EdgeInsets.only(left: getWidth(context) * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createIcon(Icons.filter_vintage_sharp, kGrayColor, size: 50),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(newsletterText1,
                        style: newsletterTextStyle(
                            kSecondaryColor, 30, null, null)),
                  ),
                ),
              ],
            ),
            sizedBoxFive,
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(newsletterText2,
                        style: newsletterTextStyle(
                            kGrayColor, 20, null, FontWeight.bold)),
                  ),
                ),
              ],
            ),
            sizedBoxFive,
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(newsletterText3,
                        style: newsletterTextStyle(
                            kSecondaryColor, 15, FontStyle.italic, null)),
                  ),
                ),
              ],
            ),
            sizedBoxTwenty,
            const Center(child: EmailBox())
          ],
        ),
      ),
    );
  }

  TextStyle newsletterTextStyle(Color? color, double? fontSize,
          FontStyle? fontStyle, FontWeight? fontWeight) =>
      TextStyle(
          color: color,
          fontStyle: fontStyle ?? FontStyle.normal,
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.normal);
}
