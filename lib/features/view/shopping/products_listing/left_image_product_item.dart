import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/init/widget/button/default_button.dart';
import 'package:kiwy_app/features/model/product/product.dart';

class LeftImageProductItem extends StatelessWidget {
  final double? screenHeight;
  final Product? product;
  const LeftImageProductItem({Key? key, this.screenHeight, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: getWidth(context) * 0.02),
      height: getHeight(context) * 0.3,
      color: product!.backgroundColor,
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  Positioned(
                    bottom: getWidth(context) * 0.01,
                    top: getWidth(context) * 0.01,
                    right: getWidth(context) * 0.01,
                    child: Transform.rotate(
                        angle: 0.2, child: Image.asset(product!.imagePath)),
                  ),
                ],
              )),
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.name,
                    style: newsletterTextStyle(
                        kSecondaryColor, 17, null, FontWeight.w900),
                  ),
                  Text(
                    product!.description,
                    style: newsletterTextStyle(kSecondaryColor, 8, null, null),
                  ),
                  sizedBoxFive,
                  DefaultButton(text: product!.name)
                ],
              )),
        ],
      ),
    );
  }
}
