import 'package:flutter/material.dart';
import 'package:klimaxapp/constants.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:klimaxapp/components.dart';
import 'package:klimaxapp/screens/newChannel_page.dart';
import 'package:klimaxapp/main.dart';
import 'package:fluttericon/typicons_icons.dart';

// To display the Get Started (Create a Channel) Page
class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: lightMode ? Colors.black : Colors.white,
                    ),
                    height: 32.0,
                    width: 32.0,
                    child: Icon(
                      Typicons.left_open,
                      color: dependent,
                      size: 17.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    'images/getstarted.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  'Create a channel',
                  style: kHeadingFontStyle.copyWith(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  'Reach out to people with your personalised channel and stream live',
                  style: kTabFontStyle.copyWith(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                GestureDetector(
                  // To push to the next page
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return NewChannelPage();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 80.0),
                    height: 45.0,
                    width: 260.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFF0055FF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Octicons.line_arrow_right,
                          size: 18.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Get Started',
                          style: kTabFontStyle.copyWith(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: EmptyNavigatorBar(
          pressedIconName: 'home',
        ), // Dummy Bottom Navigation Bar with no functionality
      ),
    );
  }
}
