import 'package:flutter/material.dart';
import 'package:klimaxapp/constants.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:klimaxapp/components.dart';
import 'premium_page.dart';
import 'package:klimaxapp/main.dart';
import 'package:fluttericon/typicons_icons.dart';

class NewChannelPage extends StatelessWidget {
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
              Center(
                child: Text(
                  'My Channel',
                  style: kHeadingFontStyle,
                ),
              ),
              SizedBox(
                width: 97.0,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ' Name your channel',
                  style: kHeadingFontStyle.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 10.0),
                color: lightMode ? Color(0xFFEBEAEA) : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: ListTile(
                  title: TextField(
                    style: kTabFontStyle.copyWith(
                        color: dependent,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400),
                    cursorColor: dependent,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      isDense: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      labelText: 'Channel Name',
                      labelStyle: kMenuFontStyle.copyWith(
                          fontSize: 17.0, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(top: 40.0, bottom: 45.0),
                color: lightMode ? Color(0xFFEBEAEA) : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: ListTile(
                  title: TextField(
                    style: kTabFontStyle.copyWith(
                        color: dependent,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w400),
                    cursorColor: dependent,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      isDense: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      labelText: 'Select a category',
                      labelStyle: kMenuFontStyle.copyWith(
                          fontSize: 17.0, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'By clicking "Done", you agree to our',
                    style: kTabFontStyle.copyWith(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    ' Terms & Conditions',
                    style: kTabFontStyle.copyWith(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PremiumPage();
                  }));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25.0),
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
                        Octicons.check,
                        size: 18.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Done',
                        style: kTabFontStyle.copyWith(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: EmptyNavigatorBar(pressedIconName: 'channel'),
      ),
    );
  }
}
