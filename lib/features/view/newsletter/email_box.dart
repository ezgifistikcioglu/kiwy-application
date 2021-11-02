import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';

import 'subscribe_button.dart';

class EmailBox extends StatelessWidget {
  const EmailBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _emailBoxPadding(context),
      child: Container(
        height: ScreenHelper.isMobile(context)
            ? getWidth(context) * 0.09
            : getWidth(context) * 0.02,
        width: getHeight(context) * 0.8,
        decoration: _emailContainerBoxDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.02),
          child: Row(
            children: [_emailTextAndIcon(context), _subscribeButton],
          ),
        ),
      ),
    );
  }

  BoxDecoration get _emailContainerBoxDecoration => BoxDecoration(
      color: kSecondarColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [emailContainerBoxShadow(kSecondaryColor)]);

  EdgeInsets _emailBoxPadding(BuildContext context) => EdgeInsets.only(
        left: getHeight(context) * 0.01,
      );

  Widget _emailTextAndIcon(BuildContext context) => Expanded(
        flex: 7,
        child: _emailTextField(context),
      );

  Widget _emailTextField(BuildContext context) => TextField(
        cursorColor: kBackgroundColor,
        style: textStyleForEmailBox(fontSize: 20, color: kGrayColor),
        decoration: _emailTextFieldDecoration(context),
      );

  InputDecoration _emailTextFieldDecoration(BuildContext context) =>
      InputDecoration(
        border: InputBorder.none,
        hintText: emailHintText,
        labelText: emailLabelText,
        labelStyle: textStyleForEmailBox(fontSize: 18, color: kBackgroundColor),
        hintStyle: textStyleForEmailBox(fontSize: 15, color: kGrayColor),
        prefixIcon: createIcon(Icons.mail_outline_rounded, kGrayColor),
      );

  Widget get _subscribeButton => const Expanded(
        flex: 3,
        child: SubscribeButton(),
      );
}
