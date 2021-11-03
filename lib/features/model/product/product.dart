import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final Color? backgroundColor;
  final String? buttonText;
  final String imagePath;
  final String? productInfo;
  final double? price;

  Product(
      {required this.name,
      required this.description,
      this.backgroundColor,
      this.buttonText,
      required this.imagePath,
      this.productInfo,
      this.price});
}

final Product tea = Product(
  imagePath: "assets/images/lemon.png",
  name: "DayDream Tea",
  description: "Original",
  buttonText: "Learn more",
  backgroundColor: const Color(0xFFE0DDFF),
);

final Product cap = Product(
  imagePath: "assets/images/kiwycapsule.png",
  name: "Perfect Capsule",
  description: "Give yourself your dream ",
  buttonText: "Learn more",
  backgroundColor: const Color(0xFFC0AF63),
);
