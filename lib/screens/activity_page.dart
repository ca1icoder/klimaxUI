import 'package:flutter/material.dart';
import 'package:klimaxapp/components.dart';
import 'package:klimaxapp/constants.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:klimaxapp/main.dart';

// Activity Page to display the activity of the user and their followers
class ActivityPage extends StatelessWidget {
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
                  'Activity',
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
          padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                heightFactor: 3.0,
                child: Text(
                  '3.4k',
                  style: kHeadingFontStyle.copyWith(fontSize: 25.0),
                ),
              ),
              Center(
                child: Text(
                  'The average number of viewers per day in the past week',
                  style: kSubheadFontStyle.copyWith(
                      fontSize: 12.0, fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 55.0),
                child: Image.asset(
                  'images/graph.png', // To display the graph
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'Manage your channel',
                style: kHeadingFontStyle.copyWith(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w900,
                  wordSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'Set default message',
                style: kTabFontStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 6.5, 50.0, 0.0),
                child: Text(
                  'Choose a message that shows as default in the case of an empty channel',
                  style: kSubheadFontStyle.copyWith(
                      fontSize: 12.0, fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigatorBar(
          pressedIconName: 'profile',
        ),
      ),
    );
  }
}
