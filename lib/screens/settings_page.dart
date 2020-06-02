import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:klimaxapp/constants.dart';
import 'package:klimaxapp/components.dart';
import 'package:klimaxapp/main.dart';
import 'package:fluttericon/typicons_icons.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                  'Settings',
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
            // To display the list of setting options
            children: <Widget>[
              SettingsTab(
                icon: FontAwesome.bell,
                title: 'Followers & activity',
                routeName: '/activity',
              ),
              SettingsTab(icon: LineariconsFree.lock_1, title: 'Privacy'),
              SettingsTab(icon: LineariconsFree.users, title: 'Accounts'),
              SettingsTab(
                icon: Octicons.comment,
                title: 'Chats',
                routeName: '/messages',
              ),
              SettingsTab(icon: Elusive.help, title: 'Help'),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Light Mode',
                      style: kHeadingFontStyle.copyWith(
                          fontWeight: FontWeight.w300),
                    ),
                    Switch(
                      // To switch between lightMode and darkMode
                      activeColor: Color(0xFF7BED8D),
                      inactiveThumbColor: Color(0xFF748A9D),
                      value: ThemeChanger.of(context).lightThemeEnabled.data,
                      onChanged: bloc
                          .changeTheme, // To change the theme of the whole app using StreamBuilder
                    ),
                  ],
                ),
              ),
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

// ListTile widget to display each option in settings. It takes icon, title and navigation route of the setting options as input.
class SettingsTab extends StatelessWidget {
  final IconData icon;
  final String title, routeName;
  SettingsTab({@required this.icon, @required this.title, this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (routeName != null) Navigator.pushNamed(context, routeName);
      },
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.only(top: 15.0),
        leading: Icon(
          icon,
          color: lightMode ? Colors.black : Colors.white,
        ),
        title: Text(
          title,
          style: kHeadingFontStyle.copyWith(fontWeight: FontWeight.w400),
        ),
        trailing: Icon(
          MfgLabs.right_open,
          size: 20.0,
          color: lightMode ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
