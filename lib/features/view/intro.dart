import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: ScreenHelper(
        web: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 10,
                child: _cardContainer(_knowledgeCard, kDesktopMaxWidth * 0.4,
                    kDesktopMaxWidth * 0.3, Alignment.topLeft),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'The Magic Power of Tea and Capsule',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: _cardContainer(
                    _customCard(kSecondarColor, _leftTeaColumnForCard),
                    kDesktopMaxWidth * 0.4,
                    kDesktopMaxWidth * 0.4,
                    Alignment.bottomLeft),
              ),
              Positioned(
                top: 50,
                right: 10,
                child: Container(
                    width: kDesktopMaxWidth * 0.4,
                    height: kDesktopMaxWidth * 0.4,
                    padding: const EdgeInsets.all(8.0),
                    child: _cardContainer(
                        _customCard(kSecondarColor, _rightCapsuleColumnForCard),
                        kDesktopMaxWidth * 0.4,
                        kDesktopMaxWidth * 0.4,
                        Alignment.topRight)),
              ),
              _introLeaf(context),
            ],
          ),
        ),
        mobile: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'The Magic Power of Tea and Capsule',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _cardContainer(
                      _knowledgeCard,
                      getMobileMaxWidth(context),
                      getMobileMaxWidth(context),
                      Alignment.topLeft,
                    ),
                  ),
                  Expanded(
                    child: _cardContainer(
                      _customCard(kSecondarColor, _leftTeaColumnForCard),
                      getMobileMaxWidth(context),
                      getMobileMaxWidth(context),
                      Alignment.bottomLeft,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.09,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: RotationTransition(
                            turns: AlwaysStoppedAnimation(
                                (MediaQuery.of(context).size.width * 0.05) /
                                    180),
                            child: Image.asset(
                              'assets/images/leafline.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                      Expanded(
                        child: RotationTransition(
                            turns: AlwaysStoppedAnimation(
                                (MediaQuery.of(context).size.height * 0.07) /
                                    180),
                            child: Image.asset(
                              'assets/images/leafline.png',
                              fit: BoxFit.fill,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.09,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _cardContainer(
                    _customCard(kSecondarColor, _rightCapsuleColumnForCard),
                    getMobileMaxWidth(context),
                    getMobileMaxWidth(context),
                    Alignment.bottomLeft,
                  ),
                ],
              ),
            ],
          ),
        ),
        tablet: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 10,
                child: _cardContainer(
                  _knowledgeCard,
                  kTabletMaxWidth * 0.4,
                  kTabletMaxWidth * 0.3,
                  Alignment.topLeft,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'The Magic Power of Tea and Capsule',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: _cardContainer(
                    _customCard(kSecondarColor, _leftTeaColumnForCard),
                    kTabletMaxWidth * 0.4,
                    kTabletMaxWidth * 0.4,
                    Alignment.bottomLeft),
              ),
              Positioned(
                top: 50,
                right: 10,
                child: Container(
                    width: kTabletMaxWidth * 0.4,
                    height: kTabletMaxWidth * 0.4,
                    padding: const EdgeInsets.all(8.0),
                    child: _cardContainer(
                        _customCard(kSecondarColor, _rightCapsuleColumnForCard),
                        kTabletMaxWidth * 0.4,
                        kTabletMaxWidth * 0.4,
                        Alignment.topRight)),
              ),
              _introLeaf(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardContainer(Widget? child, double cWidth, double cHeight,
          AlignmentGeometry alignment) =>
      Container(
          alignment: alignment,
          width: cWidth,
          height: cHeight,
          padding: const EdgeInsets.all(8.0),
          child: child);

  Widget get _leftTeaColumnForCard => Column(
        children: [
          _cardListTile(Icons.medication, 'KIWY LEMON TEA', 'To your health',
              kPrimaryColor, kPrimaryColor, kCaptionColor),
          _imageExpanded('assets/images/lemon.png'),
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

  Widget get _rightCapsuleColumnForCard => Column(
        children: [
          _cardListTile(Icons.medication, 'KIWY CAPSULE', '', kPrimaryColor,
              kPrimaryColor, kCaptionColor),
          _imageExpanded('assets/images/kiwycapsule.png'),
        ],
      );

  Widget _cardListTile(IconData? icon, String titleText, String? subtitleText,
      Color? iconColor, Color? titleColor, Color? subtitleColor) {
    return Expanded(
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
          subtitleText ?? '',
          style: TextStyle(color: subtitleColor),
        ),
      ),
    );
  }

  Widget _imageExpanded(String image) {
    return Expanded(
      flex: 5,
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
          RotationTransition(
              turns: AlwaysStoppedAnimation(
                  (MediaQuery.of(context).size.width * 0.03) / 180),
              child: Image.asset(
                'assets/images/leafline.png',
                fit: BoxFit.fill,
              )),
          RotationTransition(
              turns: AlwaysStoppedAnimation(
                  (MediaQuery.of(context).size.width * 0.08) / 180),
              child: Image.asset(
                'assets/images/leafline.png',
                fit: BoxFit.fill,
              )),
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
