import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';
import 'package:kiwy_app/core/init/widget/text/custom_text.dart';
import 'package:kiwy_app/features/view/bottombar/bottom_bar_column.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: kBlackColor,
      child: ScreenHelper.isMobile(context)
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: kBackgroundColor,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _aboutColumn,
                    _helpColumn,
                    _socialColumn,
                  ],
                ),
                Container(
                  color: kBackgroundColor,
                  width: double.maxFinite,
                  height: 1,
                ),
                sizedBoxTwenty,
                _emailText,
                sizedBoxFive,
                _adressText,
                sizedBoxTwenty,
                Container(
                  color: kBackgroundColor,
                  width: double.maxFinite,
                  height: 1,
                ),
                sizedBoxTwenty,
                _copyrightText
              ],
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: kBackgroundColor,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _aboutColumn,
                    _helpColumn,
                    _socialColumn,
                    Container(
                      color: kBackgroundColor,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [_emailText, sizedBoxFive, _adressText],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: kBackgroundColor,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                sizedBoxTwenty,
                _copyrightText,
              ],
            ),
    );
  }

  Widget get _copyrightText => const Text(
        'Copyright © 2022 | Kiwy',
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 14,
        ),
      );

  Widget get _adressText => const CustomText(
        type: 'Address',
        text: 'Lorem Ipsum Lorem Ipsum',
      );

  Widget get _emailText => const CustomText(
        type: 'Email',
        text: 'kiwy@gmail.com',
      );

  Widget get _socialColumn => const BottomBarColumn(
        heading: 'SOCIAL',
        s1: 'Twitter',
        s2: 'Facebook',
        s3: 'YouTube',
        s4: '',
      );

  Widget get _helpColumn => const BottomBarColumn(
        heading: 'HELP',
        s1: 'Payment',
        s2: 'Cancellation',
        s3: 'FAQ',
        s4: '',
      );

  Widget get _aboutColumn => const BottomBarColumn(
        heading: 'ABOUT',
        s1: 'Contact Us',
        s2: 'About Us',
        s3: 'Careers',
        s4: '',
      );
}
