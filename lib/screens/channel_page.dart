import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:klimaxapp/components.dart';
import 'package:klimaxapp/constants.dart';

// Page which displays My Channel screen
class ChannelPage extends StatelessWidget {
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
          appBar: TopAppBar(
            title: 'My Channel',
            appBar: AppBar(),
            depended: true,
          ),
          extendBodyBehindAppBar: true,
          body: Column(
            children: <Widget>[
              Container(
                height: 320.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'images/channelbg.jpeg'), // Background image of the channel
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 140.0, 20.0, 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'The Alte Chef', // Title of channel
                        style: kHeadFontStyle.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 30.0,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'An Alternative Kind of Chef', // Subtitle of channel
                            style: kTabFontStyle.copyWith(
                                fontSize: 15.0, color: Colors.white),
                          ),
                          GestureDetector(
                            // Upload button with no functionality
                            onTap: () {},
                            child: Container(
                              height: 30.0,
                              width: 110.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xFF0055FF),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Octicons.line_arrow_up,
                                      size: 16.0, color: Colors.white),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    'Upload',
                                    style: kTabFontStyle.copyWith(
                                        fontSize: 12.0, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'UPLOADS',
                      style: kHeadingFontStyle.copyWith(fontSize: 18.0),
                    ),
                    Transform.rotate(
                      angle: 160.0,
                      child: Icon(
                        RpgAwesome.eyeball,
                        color: Color(0xFFE0436B),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  // To show the uploads in a horizontal, scrollable list
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  children: <Widget>[
                    UploadTab(
                      imagePath: 'images/u1.jpeg',
                      title: 'THE 101 OF EATING HEALTHY',
                      views: '235',
                      time: 'Last week',
                    ),
                    UploadTab(
                      imagePath: 'images/u2.jpeg',
                      title: 'VEGGIES ON THE TABLE',
                      views: '1K',
                      time: 'A month ago',
                    ),
                    UploadTab(
                      imagePath: 'images/u3.jpeg',
                      title: 'THE FRUIT BASKET',
                      views: '20K',
                      time: 'A year ago',
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigatorBar(
            pressedIconName: 'channel',
          ),
        ),
      ),
    );
  }
}

// Widget to display the cards under the Uploads tab on the Channel Page
class UploadTab extends StatelessWidget {
  final String imagePath, title, views, time;
  UploadTab(
      {@required this.imagePath,
      @required this.title,
      @required this.time,
      @required this.views});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 80.0,
            width: 130.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          SizedBox(
            width: 7.0,
          ),
          Expanded(
            child: Container(
              height: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: kHeadingFontStyle.copyWith(fontSize: 13.0),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Linecons.eye,
                        color: Color(0xFF807C7C),
                        size: 13.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '$views views',
                        style: kMenuFontStyle.copyWith(fontSize: 13.0),
                      ),
                    ],
                  ),
                  Text(
                    time,
                    style: kMenuFontStyle.copyWith(fontSize: 13.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
