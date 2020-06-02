import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/zocial_icons.dart';
import 'package:klimaxapp/constants.dart';
import 'package:klimaxapp/screens/getstarted_page.dart';

// Displays the SignUp page when pushed from the Welcome Page and navigates to GetStarted page when user creates account
class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: Image.asset(
                  'images/signup.png',
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25.0, top: 10.0),
                width: 350.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'Hello,',
                      style: kHeadFontStyle,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Please Sign up with desired\naccount',
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GetStartedPage();
                    }));
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
                        'Sign up with Facebook',
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return GetStartedPage();
                    }));
                  },
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesome.google,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Sign up with Google',
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
