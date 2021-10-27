import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;
  final String s4;

  const BottomBarColumn({
    Key? key,
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
    required this.s4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _bottombarColumnText(s1),
          sizedBoxFive,
          _bottombarColumnText(s2),
          sizedBoxFive,
          _bottombarColumnText(s3),
          sizedBoxFive,
          _bottombarColumnText(s4),
        ],
      ),
    );
  }

  Text _bottombarColumnText(String name) {
    return Text(
      name,
      style: const TextStyle(
        color: kGrayColor,
        fontSize: 14,
      ),
    );
  }
}
