import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:klimaxapp/constants.dart';
import 'package:fluttericon/zocial_icons.dart';

//  The login page which appears after the Login button has been pressed on the HomePage
// On logging in, it pushes us to the Home Page
class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Image.asset(
                    'images/signin.png',
                    height: 250.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 25.0,
                ),
                width: 350.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome back,',
                      style: kHeadFontStyle,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Please Sign in with desired\naccount',
                      style: kHeadFontStyle.copyWith(fontSize: 20, height: 1.8),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.0,
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
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Zocial.facebook,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Sign in with Facebook',
                        style: kTabFontStyle.copyWith(color: Colors.white),
                      ),
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                width: 250.0,
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesome5.google,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Sign in with Google',
                        style: kTabFontStyle.copyWith(color: Colors.black),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
