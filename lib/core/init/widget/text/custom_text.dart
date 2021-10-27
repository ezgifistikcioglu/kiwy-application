import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';

class CustomText extends StatelessWidget {
  final String type;
  final String text;

  const CustomText({Key? key, required this.type, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type: ',
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 16,
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              color: kGrayColor,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
