import 'package:flutter/material.dart';
import 'package:klimaxapp/constants.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:klimaxapp/main.dart';
import 'package:fluttericon/typicons_icons.dart';

// Page to display the Get Premium Now screen after being redirected from New Channel page
class PremiumPage extends StatelessWidget {
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
                  margin: EdgeInsets.only(bottom: 40.0),
                  child: Image.asset(
                    'images/premium.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  'Get Premium Now',
                  style: kHeadingFontStyle.copyWith(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  height: 80.0,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 30.0, left: 60.0, bottom: 50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Octicons.primitive_square,
                            color: Color(0xFFFF7974),
                            size: 15.0,
                          ),
                          Text(
                            '  Ultra HD Quality',
                            style: kTabFontStyle.copyWith(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Octicons.primitive_square,
                            color: Color(0xFFFF7974),
                            size: 15.0,
                          ),
                          Text(
                            '  No more ads',
                            style: kTabFontStyle.copyWith(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Octicons.primitive_square,
                            color: Color(0xFFFF7974),
                            size: 15.0,
                          ),
                          Text(
                            '  No commitments - Cancel anytime',
                            style: kTabFontStyle.copyWith(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45.0,
                  width: 260.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF0055FF),
                  ),
                  child: Text(
                    'Get Premium \$10/mo',
                    style: kTabFontStyle.copyWith(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
