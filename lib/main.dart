// Main page source of the app. Opens the splash screen and redirects to the Welcome Page

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:klimaxapp/screens/abcProfile_page.dart';
import 'package:klimaxapp/screens/home_page.dart';
import 'package:klimaxapp/screens/welcome_page.dart';
import 'package:splashscreen/splashscreen.dart';
import 'screens/search_page.dart';
import 'screens/profile_page.dart';
import 'screens/channel_page.dart';
import 'screens/messages_page.dart';
import 'screens/settings_page.dart';
import 'screens/play_page.dart';
import 'screens/activity_page.dart';
import 'screens/abcProfile_page.dart';
import 'screens/favorites_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Color dependent = Colors
    .black; // To use the same color in the theme as the brightness of theme
bool lightMode; // To check whether light mode is enabled

// Main function to run the app
void main() {
  runApp(Klimax());
}

class Klimax extends StatefulWidget {
  @override
  _KlimaxState createState() => _KlimaxState();
}

class _KlimaxState extends State<Klimax> {
  // ThemeData for light mode
  ThemeData _buildLightTheme() {
    lightMode = true;
    dependent = Colors.white;
    final baseTheme = ThemeData.light();
    return baseTheme.copyWith(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          headline1: TextStyle(color: Colors.black),
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  // ThemeData for dark mode
  ThemeData _buildDarkTheme() {
    lightMode = false;
    dependent = Colors.black;
    final baseTheme = ThemeData.dark();
    return baseTheme.copyWith(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline1: TextStyle(color: Colors.white),
        ),
      ),
      scaffoldBackgroundColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // StreamBuilder widget used to change the theme of the entire Material App from the switch on Settings Page
      stream: bloc.lightThemeEnabler,
      initialData: false, // To set the theme to Dark Mode initially
      builder: (context, snapshot) => ThemeChanger(
        // An Inherited Widget to enable the switch of themes from the children (Settings Page) of the Material App
        lightThemeEnabled: snapshot,
        child: MaterialApp(
            title: 'Klimax',
            debugShowCheckedModeBanner: false,
            theme: snapshot.data
                ? _buildLightTheme()
                : _buildDarkTheme(), // To switch between themes

            // The named routes made with CupertinoPageRoute so as to have the slide transition between screens
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case '/splash':
                  return CupertinoPageRoute(
                      builder: (_) => MySplash(), settings: settings);
                case '/home':
                  return CupertinoPageRoute(
                      builder: (_) => HomePage(), settings: settings);
                case '/profile':
                  return CupertinoPageRoute(
                      builder: (_) => ProfilePage(), settings: settings);
                case '/search':
                  return CupertinoPageRoute(
                      builder: (_) => SearchPage(), settings: settings);
                case '/channel':
                  return CupertinoPageRoute(
                      builder: (_) => ChannelPage(), settings: settings);
                case '/messages':
                  return CupertinoPageRoute(
                      builder: (_) => MessagesPage(), settings: settings);
                case '/play':
                  return CupertinoPageRoute(
                      builder: (_) => PlayPage(), settings: settings);
                case '/settings':
                  return CupertinoPageRoute(
                      builder: (_) => SettingsPage(), settings: settings);
                case '/activity':
                  return CupertinoPageRoute(
                      builder: (_) => ActivityPage(), settings: settings);
                case '/favorites':
                  return CupertinoPageRoute(
                      builder: (_) => FavoritesPage(), settings: settings);
                case '/abc':
                  return CupertinoPageRoute(
                      builder: (_) => ABCProfilePage(), settings: settings);
                default:
                  return CupertinoPageRoute(
                      builder: (_) => HomePage(), settings: settings);
              }
            },
            home: new Builder(builder: (context) => new MySplash())),
      ),
    );
  }
}

// The Splash Screen widget
class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        []); // To make the Splash Screen full screen
    return SplashScreen(
      seconds: 3,
      imageBackground: AssetImage('images/splashklimax.png'),
      loaderColor: Colors.transparent, // Makes the loader invisible
      navigateAfterSeconds:
          WelcomePage(), // Navigates to the Welcome Page after 3 seconds
    );
  }
}

// Bloc to enable the change of theme of all the widgets in the tree
class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get lightThemeEnabler => _themeController.stream;
  void close() {
    _themeController.close();
  }
}

final bloc = Bloc();

// Inherited Widget to pass data (snapshot) between parent and child in the Widget tree
class ThemeChanger extends InheritedWidget {
  final AsyncSnapshot<bool> lightThemeEnabled;
  ThemeChanger(
      {Key key, @required this.lightThemeEnabled, @required Widget child})
      : assert(lightThemeEnabled != null),
        assert(child != null),
        super(key: key, child: child);

  static ThemeChanger of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeChanger>();
  }

  @override
  bool updateShouldNotify(ThemeChanger oldTheme) {
    // To notify if the theme has been changed
    return lightThemeEnabled != oldTheme.lightThemeEnabled;
  }
}
