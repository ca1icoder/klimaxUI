import 'package:flutter/material.dart';
import 'package:klimaxapp/components.dart';
import 'package:klimaxapp/constants.dart';
import 'package:klimaxapp/main.dart';
import 'package:fluttericon/typicons_icons.dart';

// The page which displays the Profile of American Broadcasting Company
class ABCProfilePage extends StatelessWidget {
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
                  'Profile',
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
          padding: const EdgeInsets.symmetric(horizontal: 33.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: AssetImage(
                            'images/rv3.jpeg'), // Profile picture of ABC
                        fit: BoxFit.cover),
                  ),
                  height: 76.0,
                  width: 76.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Text(
                  'American Broadcasting Company',
                  textAlign: TextAlign.center,
                  style: kHeadFontStyle.copyWith(
                      fontSize: 20.0, letterSpacing: 0.7),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Followers',
                        style: kTabFontStyle.copyWith(
                          fontSize: 16.0,
                          color: Color(0xFF585656),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '12k', // Number of followers
                        style: kTabFontStyle.copyWith(
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Following',
                        style: kTabFontStyle.copyWith(
                          fontSize: 16.0,
                          color: Color(0xFF585656),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '120', // Number of following
                        style: kTabFontStyle.copyWith(fontSize: 17.0),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  // Bio of ABC
                  'The American Broadcasting Company (ABC) is an American commercial broadcast radio and television network that is a flagship property of Walt Disney Television, a subsidiary of the Disney Media Networks division of The Walt Disney Company',
                  style: kSubheadFontStyle.copyWith(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.5,
                      fontSize: 10.0,
                      height: 1.7),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      // Follow button having no functionality
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: lightMode ? Colors.black : Colors.white),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(
                          'Follow',
                          style: kHeadingFontStyle.copyWith(fontSize: 15.0),
                        ),
                      ),
                    ),
                    GestureDetector(
                      // Message button having no functionality
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 30.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0,
                                color: lightMode ? Colors.black : Colors.white),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          'Message',
                          style: kHeadingFontStyle.copyWith(fontSize: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'UPLOADS',
                    style: kHeadingFontStyle.copyWith(
                        fontSize: 17.0, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 280.0,
                child: ListView.separated(
                  // To view the Uploads in a horizontal, scrollable list
                  scrollDirection: Axis.horizontal,
                  itemCount: channelImagePath.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChannelContainer(
                      image: abcImagePath[index],
                      route: false,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    indent: 15.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigatorBar(
          pressedIconName: 'home',
        ),
      ),
    );
  }
}
