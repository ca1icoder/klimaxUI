import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'constants.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main.dart';

// List to store the fileName of images to be used under 'Recently Viewed' tab on the HomePage
final List<String> rvImagePath = [
  'rv1.jpeg',
  'rv2.jpeg',
  'rv3.jpeg',
  'rv4.jpeg',
  'rv5.jpeg'
];

// List to store the title of cards to be used under 'Recently Viewed' tab on the HomePage
final List<String> rvTitle = [
  'National Geographic',
  'Telemundo',
  'Hallmark Channel',
  'Disney Junior',
  'ESPN'
];

// The container which displays the card under the Recently Viewed tab
class RVContainer extends StatelessWidget {
  final String image;
  final String title;
  RVContainer({@required this.image, @required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: 55.0,
      height: 100.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            height: 55.0,
            width: 55.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: AssetImage('images/$image'), fit: BoxFit.cover),
            ),
          ),
          Text(
            title,
            style: kSubheadFontStyle.copyWith(
              fontSize: 10.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// List to store the fileName of images to be used under 'Channels' tab on the HomePage
final List<String> channelImagePath = [
  'c1.jpeg',
  'c2.jpeg',
  'c3.jpeg',
];

// List to store the title of cards to be used under 'Channels' tab on the HomePage
final List<String> channelTitle = [
  'American Broadcasting Company',
  'The CW Network',
  'CBS Tele',
];

// The container which displays the card under the Channels tab on the HomePage
class ChannelContainer extends StatelessWidget {
  final String image;
  final String title;
  final bool route;
  ChannelContainer({@required this.image, this.title = '', this.route = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route) Navigator.pushNamed(context, '/play');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        width: 140.0,
        height: 280.0,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              height: 200.0,
              width: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: AssetImage('images/$image'), fit: BoxFit.fill),
              ),
            ),
            if (title != '')
              Text(
                title,
                style: kSubheadFontStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}

// List to store the fileName of images to be used under 'Most Popular Channels' tab on the HomePage
final List<String> popularImagePath = [
  'p1.jpeg',
  'p2.png',
];

// The container which displays the card under the Most Popular Channels tab on the HomePage
class PopularContainer extends StatelessWidget {
  final String image;
  PopularContainer({@required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 100.0,
      width: 150.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
            image: AssetImage('images/$image'), fit: BoxFit.cover),
      ),
      child: Center(
          child: Icon(
        // The play icons over the Most Popular Channel cards
        Octicons.play,
        color: Colors.white,
        size: 45.0,
      )),
    );
  }
}

// Bottom Navigator Widget which navigates to: Home, Channel, Messages and Profile
class BottomNavigatorBar extends StatelessWidget {
  final String pressedIconName; // To know which button has been pressed
  BottomNavigatorBar({@required this.pressedIconName});

  @override
  Widget build(BuildContext context) {
    bool home = false;
    bool channel = false;
    bool messages = false;
    bool profile = false;
    if (pressedIconName == 'home')
      home = true;
    else if (pressedIconName == 'channel')
      channel = true;
    else if (pressedIconName == 'messages')
      messages = true;
    else if (pressedIconName == 'profile') profile = true;
    return Container(
      margin: EdgeInsets.only(bottom: 5.0),
      color: Colors.transparent,
      height: 50.0,
      child: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            NavigatorIcon(
              name: 'home',
              pressed: home,
            ),
            NavigatorIcon(
              name: 'channel',
              pressed: channel,
            ),
            NavigatorIcon(
              name: 'messages',
              pressed: messages,
            ),
            NavigatorIcon(
              name: 'profile',
              pressed: profile,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display the button on the Bottom Navigator and give them functionality
class NavigatorIcon extends StatelessWidget {
  NavigatorIcon({@required this.name, @required this.pressed});

  final bool pressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      GestureDetector(
        onTap: () {
          // To navigate to the corresponding page
          if (!pressed) Navigator.pushNamed(context, '/$name');
        },
        child: Container(
          height: 35,
          width: 35,
          child: SvgPicture.asset(
            // Had to use SVGs because I couldn't find icons similar to the ones in the wireframe
            'images/$name.svg',
            color: Color(0xFF888888),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      if (pressed)
        Image.asset(
            'images/blob.png'), // To display the blue blob over pressed button
    ]);
  }
}

// AppBar Widget to display custom app bars over different pages
class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  final bool
      depended; // To check if the color of title and menu icon needs to be changed when in lightMode
  TopAppBar(
      {@required this.title, @required this.appBar, this.depended = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                Navigator.pushNamed(context,
                    '/search'); // To push to the Search Page when button  is pressed
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: lightMode && !depended ? Colors.black : Colors.white,
                ),
                height: 32.0,
                width: 32.0,
                child: Icon(
                  FontAwesome5.equals,
                  color: !depended
                      ? dependent
                      : Colors
                          .black, // To change color of icon according to the Theme and requirement
                  size: 17.0,
                ),
              ),
            ),
          ),
          depended // To change color of title according to the Theme and requirement
              ? Text(
                  title,
                  style: kHeadFontStyle.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                )
              : Text(
                  title,
                  style: kHeadFontStyle.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('images/dp.png'), fit: BoxFit.fill),
                ),
                height: 32.0,
                width: 32.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

// List to store the fileName of images to be used under 'More from this channel' tab on the PlayPage
final List<String> abcImagePath = [
  'up1.jpeg',
  'up2.jpeg',
  'up3.jpeg',
];

// Non-functional dummy Bottom Navigator to use in dummy pages
class EmptyNavigatorBar extends StatelessWidget {
  final String pressedIconName;
  EmptyNavigatorBar({this.pressedIconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 50.0,
      margin: EdgeInsets.only(bottom: 5.0),
      child: BottomAppBar(
        elevation: 0.0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            EmptyIcon(
              name: 'home',
              pressed: pressedIconName == 'home' ? true : false,
            ),
            EmptyIcon(
              name: 'channel',
              pressed: pressedIconName == 'channel' ? true : false,
            ),
            EmptyIcon(
              name: 'messages',
              pressed: pressedIconName == 'messages' ? true : false,
            ),
            EmptyIcon(
              name: 'profile',
              pressed: pressedIconName == 'profile' ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}

// Non-functional dummy Bottom Navigator Icons to use in dummy Bottom Navigator
class EmptyIcon extends StatelessWidget {
  EmptyIcon({@required this.name, this.pressed = false});

  final bool pressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        height: 35,
        width: 35,
        child: SvgPicture.asset(
          'images/$name.svg',
          color: Color(0xFF888888),
          fit: BoxFit.fitWidth,
        ),
      ),
      if (pressed) Image.asset('images/blob.png'),
    ]);
  }
}
