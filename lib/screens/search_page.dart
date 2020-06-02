import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:klimaxapp/constants.dart';
import 'package:klimaxapp/main.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttericon/typicons_icons.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool notify = false; // To check if notification button has been pressed

  // To change state when notification button is pressed
  void changeNotify() {
    setState(() {
      notify = notify ? false : true;
    });
  }

  _SearchPageState();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          notify // To display search page or notification page according to the status of notify
              ? NotificationScaffold(
                  notify: changeNotify,
                )
              : SearchScaffold(
                  notify: changeNotify,
                ),
    );
  }
}

// Displays the Search tab and staggered grid of images when search button is pressed
class SearchScaffold extends StatelessWidget {
  final Function
      notify; // To change state of parent widget through notify function
  SearchScaffold({@required this.notify});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                    LineariconsFree.cross,
                    color: dependent,
                    size: 20.0,
                  ),
                ),
              ),
            ),
            Text(
              'KLIMAX',
              style: kHeadFontStyle.copyWith(
                  fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: FlatButton(
                onPressed: () {
                  notify();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      width: 1.0,
                      color: lightMode ? Colors.black : Colors.white,
                    ),
                  ),
                  height: 32.0,
                  width: 32.0,
                  child: Icon(
                    FontAwesome.bell,
                    size: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.only(bottom: 10.0, right: 10.0, left: 10.0),
              color: Color(0xFFEBEAEA),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                title: TextField(
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isDense: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    labelText: 'Search',
                    labelStyle: kMenuFontStyle.copyWith(fontSize: 17.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: 16,
                itemBuilder: (BuildContext context, int index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      image: DecorationImage(
                          image: AssetImage('images/${images[index]}'),
                          fit: BoxFit.cover)),
                ),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 2 : 1),
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Displays the notifications when notification bell is pressed
class NotificationScaffold extends StatelessWidget {
  final Function
      notify; // To change state of parent widget through notify function
  NotificationScaffold({@required this.notify});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                // To call notify when bell icon is pressed
                onPressed: () {
                  notify();
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
            Text(
              'Notifications',
              style: kHeadFontStyle.copyWith(
                  fontSize: 20.0, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1.0,
                    color: lightMode ? Colors.black : Colors.white,
                  ),
                ),
                height: 32.0,
                width: 32.0,
                child: Icon(
                  FontAwesome.bell_alt,
                  color: lightMode ? Colors.black : Colors.white,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, bottom: 10.0, top: 12.0),
                  child: Text(
                    'This week',
                    style: kHeadingFontStyle,
                  ),
                )),
            Expanded(
                child: ListView.separated(
              // To display comments in a horizontal, scrollable list
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                return notifications[
                    index]; // Using notifications (List of NotificationTiles to display comments)
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: 45.0,
                  endIndent: 45.0,
                  thickness: 0.5,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

// List of images to displayed on the search page in the staggered grid view
List<String> images = [
  'up3.jpeg',
  'rv1.jpeg',
  'c1.jpeg',
  'p2.png',
  'u1.jpeg',
  'rv2.jpeg',
  'p1.jpeg',
  'up2.jpeg',
  'u2.jpeg',
  'c2.jpeg',
  'c3.jpeg',
  'u3.jpeg',
  'rv5.jpeg',
  'rv4.jpeg',
  'channelbg.jpeg',
  'up1.jpeg',
];

// List of notification tiles to be displayed on the notification page
// Each ListTile has a picture, notification text and time
List<ListTile> notifications = [
  ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage('images/rv1.jpeg'),
    ),
    title: Text(
        'American Broadcasting Channel shared a new stream on their profile. Go, check it out now!'),
    subtitle: Text('1m'),
  ),
  ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage('images/m2.png'),
    ),
    title: Text(
        'Devon Fisher has 3 new messages for you. Go to Messages to read them.'),
    subtitle: Text('3h'),
  ),
  ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage('images/c2.jpeg'),
    ),
    title: Text(
        'The CW Network launched a brand new series: \'everybody hates chris\'. Watch it in 1080p with Klimax Premium.'),
    subtitle: Text('1d'),
  ),
  ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage('images/m3.png'),
    ),
    title: Text('You started following Eleanor Steward. Say \'Hi\' to them.'),
    subtitle: Text('2d'),
  ),
  ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage('images/m7.png'),
    ),
    title: Text(
        'Soham Hawkins commented on your movie stream: \'Finally a refreshing TV Show that isnt based on false eyelashes & sqeaky voiced prime donnas trying to make their mark.\''),
    subtitle: Text('2d'),
  ),
  ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage('images/channelbg.jpeg'),
    ),
    title: Text(
        'You have 48 new views on your channel The Alte Chef. Keep uploading more content to make your channel grow.'),
    subtitle: Text('5d'),
  ),
  ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage('images/m6.png'),
    ),
    title: Text(
        'Theresa Webb has a new message for you. Go to Messages to read it.'),
    subtitle: Text('6d'),
  ),
];
