import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final Function()? press;
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 10,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            primary: kPrimaryColor),
        onPressed: press,
        child: Text(text!.toUpperCase(),
            style: GoogleFonts.architectsDaughter(
                textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000)))),
      ),
    );
  }
}
