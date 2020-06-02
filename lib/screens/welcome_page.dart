import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klimaxapp/constants.dart';
import 'package:klimaxapp/screens/login_page.dart';
import 'package:klimaxapp/screens/signup_page.dart';

// Welcome Page which is displayed immediately after the splash screen ends. Navigates to SignUp/LogIn Page as per user choice.
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.restoreSystemUIOverlays();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
              child: Image.asset(
                'images/welcomescreen.gif',
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 60.0),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    width: 300.0,
                    child: Text(
                      'Catch the best of entertainment from various channels',
                      style: kHeadFontStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 50.0),
                    child: Center(
                      child: Text(
                        'Sports. Movies. Lifestyle. Reality. Music.',
                        style: kSubheadFontStyle,
                      ),
                    ),
                  ),
                  Container(
                    width: 250.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFF0055FF),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SignUp();
                          },
                        ));
                      },
                      child: Center(
                          child: Text(
                        'CREATE ACCOUNT',
                        style: kTabFontStyle.copyWith(color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    width: 250.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return LogIn();
                          },
                        ));
                      },
                      child: Center(
                        child: Text(
                          'LOG IN',
                          style: kTabFontStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
