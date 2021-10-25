import 'package:flutter/material.dart';
import 'package:kiwy_app/core/constants/app_constants.dart';
import 'package:kiwy_app/core/constants/screen_helper.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: ScreenHelper(
        desktop: Row(
          children: [
            Container(
              width: kDesktopMaxWidth * 0.4,
              height: kDesktopMaxWidth * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: kSecondarColor,
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: ListTile(
                        leading: Icon(
                          Icons.coffee_rounded,
                          color: kPrimaryColor,
                        ),
                        title: Text(
                          'KIWY LEMON TEA',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        subtitle: Text(
                          'To your health',
                          style: TextStyle(color: kCaptionColor),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Image.asset(
                        'assets/images/lemon.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    //Padding(
                    //  padding: const EdgeInsets.all(4.0),
                    //  child: Text(
                    //    'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                    //    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    //  ),
                    //),
                  ],
                ),
              ),
            ),
          ],
        ),
        mobile: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              color: kSecondarColor,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: getMobileMaxWidth(context),
                ),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width / 4,
                width: MediaQuery.of(context).size.height / 8,
                child: const Text(
                  'Normal Screen',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Card(
              color: kSecondarColor,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: getMobileMaxWidth(context),
                ),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width / 4,
                width: MediaQuery.of(context).size.height / 8,
                child: const Text(
                  'Normal Screen',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        tablet: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              height: kTabletMaxWidth * 0.20,
              color: Colors.red,
              child: const Text(
                'Left Part of Tablet Screen',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              height: kTabletMaxWidth * 0.20,
              color: Colors.green,
              child: const Text(
                'Right Part of Tablet Screen',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
