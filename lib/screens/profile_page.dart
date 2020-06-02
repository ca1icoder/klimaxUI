import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:klimaxapp/constants.dart';
import 'package:klimaxapp/components.dart';
import 'package:klimaxapp/User.dart';
import 'package:klimaxapp/main.dart';

// A user object to view the properties corresponding to the user on the Profile Page
User newUser = User(
    name: 'Regina Williamson',
    displayPictureFilename: 'dp.png',
    followers: 528,
    following: 10);

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // To redirect to Home Page if back button is pressed on the bottom navigator of the phone
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/home');
        return false;
      },
      child: SafeArea(
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
                      Navigator.pushNamed(context, '/search');
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
                        FontAwesome5.equals,
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
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 45.0, vertical: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: AssetImage(
                              'images/${newUser.displayPictureFilename}'),
                          fit: BoxFit.fill),
                    ),
                    height: 80.0,
                    width: 80.0,
                  ),
                  Text(
                    newUser.name,
                    style: kHeadFontStyle.copyWith(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Followers ${newUser.followers}',
                        style: kTabFontStyle.copyWith(
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        'Following ${newUser.following}',
                        style: kTabFontStyle.copyWith(fontSize: 15.0),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      // To navigate to Favorites Page (No content uploaded page)
                      Navigator.pushNamed(context, '/favorites');
                    },
                    child: Container(
                      height: 110.0,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFF888888), width: 7.0),
                          color:
                              lightMode ? Color(0xFF121212) : Color(0xFFFAFBEF),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesome5.heart,
                            color: dependent,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            'Favorites',
                            style: kHeadingFontStyle.copyWith(color: dependent),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        // Edit button without functionality
                        onTap: () {},
                        child: Container(
                          height: 110.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0,
                                  color:
                                      lightMode ? Colors.black : Colors.white),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                LineariconsFree.pencil,
                              ),
                              Text(
                                'Edit',
                                style: kHeadingFontStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        // Settings button to push to Settings Page
                        onTap: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                        child: Container(
                          height: 110.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0,
                                  color:
                                      lightMode ? Colors.black : Colors.white),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                LineariconsFree.cog_2,
                              ),
                              Text(
                                'Settings',
                                style: kHeadingFontStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigatorBar(
            pressedIconName: 'profile',
          ),
        ),
      ),
    );
  }
}
