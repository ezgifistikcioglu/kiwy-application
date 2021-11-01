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
        height: MediaQuery.of(context).size.width * 0.03,
        width: MediaQuery.of(context).size.height * 0.7,
        decoration: _emailContainerBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        left: MediaQuery.of(context).size.height * 0.01,
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
        labelStyle: textStyleForEmailBox(
            fontSize: ScreenHelper.isMobile(context) ? 13 : 20,
            color: kBackgroundColor),
        hintStyle: textStyleForEmailBox(
            fontSize: ScreenHelper.isMobile(context) ? 13 : 15,
            color: kGrayColor),
        prefixIcon: createIcon(Icons.mail_outline_rounded, kGrayColor),
      );

  Widget get _subscribeButton => const Expanded(
        flex: 3,
        child: Center(child: SubscribeButton()),
      );
}
