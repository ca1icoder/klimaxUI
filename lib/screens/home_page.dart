import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klimaxapp/constants.dart';
import 'package:klimaxapp/components.dart';

// Home screen of the app which redirects to the Play Page when user taps on one of the Channels
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // To pop up dialog box when back button is pressed asking whether the user wants to exit the app
    Future<bool> _onBackPressed() {
      return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: new Text('Are you sure?'),
              content: new Text('Do you want to exit Klimax?'),
              actions: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new FlatButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: new Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      // To perform function back button is pressed
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: Scaffold(
          appBar: TopAppBar(
            title: 'KLIMAX',
            appBar: AppBar(),
          ),
          body: ListView(
            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
            children: <Widget>[
              Text(
                'RECENTLY VIEWED',
                style: kTabFontStyle,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 120.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: rvImagePath.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RVContainer(
                      image: rvImagePath[index],
                      title: rvTitle[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    indent: 15.0,
                  ),
                ),
              ),
              Text(
                'CHANNELS',
                style: kTabFontStyle,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 280.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: channelImagePath.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChannelContainer(
                      image: channelImagePath[index],
                      title: channelTitle[index],
                      route: true,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    indent: 15.0,
                  ),
                ),
              ),
              Text(
                'MOST POPULAR CHANNELS',
                style: kTabFontStyle,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularImagePath.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PopularContainer(
                      image: popularImagePath[index],
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
          bottomNavigationBar: BottomNavigatorBar(
            pressedIconName: 'home',
          ),
        ),
      ),
    );
  }
}
