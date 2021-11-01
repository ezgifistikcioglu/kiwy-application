import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';
import 'package:kiwy_app/core/init/widget/shape/custom_shape_border_top.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

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

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: RichText(
            text: TextSpan(
              children: [
                _textSpanWithPacifico("KIWY", context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextSpan _textSpanWithPacifico(String text, BuildContext context) => TextSpan(
        text: text,
        style: GoogleFonts.pacifico(
          color: Colors.white,
          fontSize: ScreenHelper.isMobile(context) ? 20.0 : 32.0,
          fontWeight: FontWeight.bold,
        ),
      );
}

class HeaderRow extends StatefulWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  State<HeaderRow> createState() => _HeaderRowState();
}

class _HeaderRowState extends State<HeaderRow> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
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
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02),
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
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
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
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
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
