import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(context) * 0.8,
      width: getWidth(context),
      child: ScreenHelper.isMobile(context)
          ? _mobileColumn(context)
          : _webColumn(context),
    );
  }

  Widget _webColumn(BuildContext context) => Container(
        padding: smallPadding(context),
        decoration: _infoBgImage(BoxFit.fitWidth),
        child: Stack(
          children: [
            _infoCardPositionTop(context),
            Center(
              child: Column(
                children: [
                  _introHeaderText(40),
                ],
              ),
            ),
            _teaPositionRight(
              context,
            ),
            _capsulePositionLeft(
                context,
                _cardContainer(
                    _customCard(
                        kSecondarColor, _rightCapsuleColumnForCard(context)),
                    kDesktopMaxWidth * 0.4,
                    kDesktopMaxWidth * 0.4,
                    Alignment.bottomLeft)),
            sizedBoxTwenty,
            _introLeaf(context),
          ],
        ),
      );

  Widget _mobileColumn(BuildContext context) => Container(
        padding: smallPadding(context),
        decoration: _infoBgImage(BoxFit.cover),
        child: Stack(
          children: [
            Column(
              children: [
                _introHeaderText(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoCard(context),
                    _teaCard(context),
                  ],
                ),
              ],
            ),
            _leafRotationColumn(context),
            _capsulePositionLeft(
              context,
              _cardContainer(
                _customCard(
                    kSecondarColor, _rightCapsuleColumnForCard(context)),
                getMobileMaxWidth(context),
                getMobileMaxWidth(context),
                Alignment.bottomLeft,
              ),
            )
          ],
        ),
      );

  BoxDecoration _infoBgImage(BoxFit? fit) => BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/bg.jpg"),
          fit: fit,
        ),
      );

  Widget _introHeaderText(double? fontSize) => Text(
        introText,
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: fontSize),
      );

  Widget _leafRotationColumn(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: _getRotation(
                    context,
                    _customAlwaysStoppedAnimation(
                        context, (getWidth(context) * 0.05) / 180)),
              ),
              Expanded(
                  child: _getRotation(
                      context,
                      _customAlwaysStoppedAnimation(
                          context, (getHeight(context) * 0.07) / 180))),
            ],
          ),
        ],
      );

  Widget _infoCardPositionTop(BuildContext context) => Positioned(
        left: getWidth(context) * 0.01,
        child: _cardContainer(_knowledgeCard, kDesktopMaxWidth * 0.4,
            kDesktopMaxWidth * 0.3, Alignment.topLeft),
      );

  Widget _capsulePositionLeft(BuildContext context, Widget child) => Positioned(
        bottom: getHeight(context) * 0.01,
        left: getWidth(context) * 0.01,
        child: child,
      );

  Widget _teaPositionRight(BuildContext context) => Positioned(
      top: getHeight(context) * 0.01,
      right: getWidth(context) * 0.01,
      child: _cardContainer(
          _customCard(kSecondarColor, _leftTeaColumnForCard(context)),
          kDesktopMaxWidth * 0.4,
          kDesktopMaxWidth * 0.4,
          Alignment.topRight));

  Widget _getRotation(BuildContext context, Animation<double> turns) =>
      RotationTransition(turns: turns, child: _centerLeafImage);

  AlwaysStoppedAnimation<double> _customAlwaysStoppedAnimation(
          BuildContext context, double value) =>
      AlwaysStoppedAnimation((value));

  Widget _teaCard(BuildContext context) => Expanded(
        child: _cardContainer(
          _customCard(kSecondarColor, _leftTeaColumnForCard(context)),
          getMobileMaxWidth(context),
          getMobileMaxWidth(context),
          Alignment.bottomLeft,
        ),
      );

  Widget _infoCard(BuildContext context) => Expanded(
        child: _cardContainer(
          _knowledgeCard,
          getMobileMaxWidth(context),
          getMobileMaxWidth(context),
          Alignment.topLeft,
        ),
      );

  Widget get _centerLeafImage => Image.asset(
        'assets/images/leafline.png',
        fit: BoxFit.fill,
      );

  Widget _cardContainer(Widget? child, double cWidth, double cHeight,
          AlignmentGeometry alignment) =>
      Container(
          alignment: alignment,
          width: cWidth,
          height: cHeight,
          padding: const EdgeInsets.all(8.0),
          child: child);

  Widget _leftTeaColumnForCard(BuildContext context) => Column(
        children: [
          _cardListTile(Icons.coffee_sharp, 'KIWY LEMON TEA', 'To your health',
              kPrimaryColor, kPrimaryColor, kCaptionColor),
          _imageExpanded('assets/images/lemon.png', context),
        ],
      );

  Widget _customCard(Color? color, Widget? child) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: color,
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        child: child,
      );

  Widget _rightCapsuleColumnForCard(BuildContext context) => Column(
        children: [
          _cardListTile(Icons.medication, 'KIWY CAPSULE', null, kPrimaryColor,
              kPrimaryColor, kCaptionColor),
          _imageExpanded('assets/images/kiwycapsule.png', context),
        ],
      );

  Widget _cardListTile(IconData? icon, String titleText, String? subtitleText,
          Color? iconColor, Color? titleColor, Color? subtitleColor) =>
      Expanded(
        flex: 1,
        child: ListTile(
          leading: Icon(
            icon,
            color: iconColor,
          ),
          title: Text(
            titleText,
            style: TextStyle(color: titleColor),
          ),
          subtitle: Text(
            subtitleText ?? 'lorem',
            style: TextStyle(color: subtitleColor),
          ),
        ),
      );

  Widget _imageExpanded(String image, BuildContext context) {
    return Expanded(
      flex: ScreenHelper.isMobile(context) ? 2 : 5,
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _introLeaf(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _getRotation(
            context,
            _customAlwaysStoppedAnimation(
                context, (getWidth(context) * 0.03) / 180),
          ),
          _getRotation(
            context,
            _customAlwaysStoppedAnimation(
                context, (getWidth(context) * 0.08) / 180),
          ),
        ],
      );

  Widget get _knowledgeCard => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: kSecondaryColor,
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        child: Column(
          children: [
            _knowledgeCardListTile,
            _knowledgeCardListTile,
          ],
        ),
      );

  Widget get _knowledgeCardListTile => const ListTile(
        leading: Icon(
          Icons.run_circle_outlined,
          color: kPrimaryColor,
        ),
        title: Text(
          'Lorem Ipsum',
          style: TextStyle(color: kPrimaryColor),
        ),
        subtitle: Text(
          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
          style: TextStyle(color: kCaptionColor),
        ),
      );
}
