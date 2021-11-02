import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'header.dart';

class HeaderRow extends StatefulWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  State<HeaderRow> createState() => _HeaderRowState();
}

class _HeaderRowState extends State<HeaderRow> {
  @override
  Widget build(BuildContext context) {
    double width = getWidth(context);
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.all(getHeight(context) * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: width / 8),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? isHovering[0] = true : isHovering[0] = false;
                  });
                },
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _leftAppBarTexts("Shop", 0),
                    sizedBoxFive,
                    _forShowingAnUnderlineOnHover(0)
                  ],
                ),
              ),
              SizedBox(width: width / 20),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? isHovering[1] = true : isHovering[1] = false;
                  });
                },
                onTap: () {},
                child: _leftAppBarTexts('About', 1),
              ),
              SizedBox(width: width / 20),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? isHovering[2] = true : isHovering[2] = false;
                  });
                },
                onTap: () {},
                child: _leftAppBarTexts('Reviews', 2),
              ),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  _signUpAndLoginText('Sign Up'),
                  SizedBox(
                    width: width / 40,
                  ),
                  _signUpAndLoginText('Login'),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signUpAndLoginText(String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: const TextStyle(
            color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _leftAppBarTexts(String text, int index) {
    return Text(
      text,
      style: TextStyle(
          color: isHovering[index] ? kCaptionColor : kPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _forShowingAnUnderlineOnHover(int index) {
    return Visibility(
      maintainAnimation: true,
      maintainState: true,
      maintainSize: true,
      visible: isHovering[index],
      child: Container(
        height: 2,
        width: 20,
        color: Colors.white,
      ),
    );
  }
}
