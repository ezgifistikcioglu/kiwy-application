import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/globals.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';
import 'package:kiwy_app/core/init/widget/shape/custom_shape_border_down.dart';
import 'package:kiwy_app/features/view/bottombar/bottom_bar.dart';
import 'package:kiwy_app/features/view/header/header.dart';
import 'package:kiwy_app/features/view/intro.dart';
import 'package:kiwy_app/features/view/shopping/products_listing/products_listing.dart';

import 'newsletter/newsletter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      appBar: AppBar(
        backgroundColor: kBlackColor,
        shape: CustomShapeBorderDown(
            ScreenHelper.isMobile(context)
                ? curveHeightDownMobile
                : curveHeightDown,
            context),
        flexibleSpace: Image.asset(
          'assets/images/cover.png',
          fit: BoxFit.fitWidth,
        ),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return isHovering[index]

                    /// Web tab bar menu
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 58.0),
                        ),
                      )

                    /// Mobile Hamburger menu
                    : const ListTile(
                        title: Text(
                          "isHovering[index].toString()",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  /// Mobile Hamburger menu list space
                  height: 10.0,
                );
              },
              itemCount: isHovering.length,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            SizedBox(
              height: getHeight(context) * 0.002,
            ),
            const IntroPage(),
            SizedBox(
              height: getHeight(context) * 0.03,
            ),
            const ProductsListing(),
            const Newsletter(),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
