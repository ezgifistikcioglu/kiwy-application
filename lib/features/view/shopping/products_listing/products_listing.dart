import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';
import 'package:kiwy_app/features/model/product/product.dart';
import 'package:kiwy_app/features/view/shopping/products_listing/right_image_product_item.dart';

import 'left_image_product_item.dart';

class ProductsListing extends StatelessWidget {
  const ProductsListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ScreenHelper.isMobile(context)
          ? Column(
              children: [
                RightImageProductItem(
                    screenHeight: getHeight(context), product: cap),
                LeftImageProductItem(
                    screenHeight: getHeight(context), product: tea),
              ],
            )
          : null,
    );
  }
}
