import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';

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
