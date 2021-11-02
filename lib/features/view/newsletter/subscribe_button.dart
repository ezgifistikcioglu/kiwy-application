import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';

class SubscribeButton extends StatelessWidget {
  const SubscribeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: getHeight(context) * 0.04,
        width: getWidth(context) / 0.5,
        decoration: _subscribeDecoration,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: _subscribeTextAndIcon(context),
          ),
        ),
      ),
    );
  }

  BoxDecoration get _subscribeDecoration => BoxDecoration(
          gradient: _subscribeGradient,
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: [
            emailContainerBoxShadow(kPrimaryColor),
          ]);

  LinearGradient get _subscribeGradient => const LinearGradient(
      colors: [kSecondaryColor, kBackgroundColor],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft);

  Widget _subscribeTextAndIcon(BuildContext context) => Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _subscribeText(context),
            Expanded(
              child: Center(
                child: createIcon(Icons.touch_app, kSecondarColor,
                    size: ScreenHelper.isMobile(context)
                        ? getWidth(context) * 0.05
                        : getWidth(context) * 0.02),
              ),
            )
          ],
        ),
      );

  Widget _subscribeText(BuildContext context) => Text(
        subscribeText,
        style: textStyleForEmailBox(
            fontSize: ScreenHelper.isMobile(context) ? 14 : 20,
            color: kCaptionColor),
      );
}
