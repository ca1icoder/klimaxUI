import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klimaxapp/constants.dart';
import 'package:klimaxapp/main.dart';
import 'package:fluttericon/typicons_icons.dart';

// Page which displays the chat messages
class ChatPage extends StatelessWidget {
  final String name, dpName;
  ChatPage({@required this.name, @required this.dpName});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: ChatAppBar(
          // To display the name and picture of the person being messaged in the app bar
          title: name,
          appBar: AppBar(),
          dpName: dpName,
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: Container(
              child: ListView(
                // To display the chat in a vertical, scrollable list
                reverse: true,
                padding: EdgeInsets.only(top: 25.0),
                children: <Widget>[
                  ChatText(
                    text:
                        'Great\nWhat do you think about the series - For Life?',
                    sentByUser: false,
                  ),
                  ChatText(
                    text: 'How\'re you doing?',
                    sentByUser: true,
                  ),
                  ChatText(
                    text: 'Hi 😜',
                    sentByUser: false,
                  ),
                  ChatText(
                    text: 'Hello',
                    sentByUser: true,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
            child: Row(
              // To display the text bar to type new texts
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: lightMode ? Colors.black : Colors.white),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 12.0, 0.0, 0.0),
                    child: TextField(
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
                        labelText: 'Type you message here',
                        labelStyle: kTabFontStyle.copyWith(
                            color: dependent,
                            fontSize: 13.5,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF0055FF)),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

// To check and display the texts according to the theme and the sender
class ChatText extends StatelessWidget {
  final String text;
  final bool sentByUser;
  ChatText({@required this.text, @required this.sentByUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment:
              sentByUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: sentByUser
                          ? Color(0xFF888888)
                          : (lightMode ? Colors.black : Colors.white),
                      width: 3.0),
                  color: sentByUser
                      ? (lightMode ? Colors.black : Colors.white)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Text(
                text,
                style: kSubheadFontStyle.copyWith(
                    color: sentByUser
                        ? (lightMode ? Colors.white : Colors.black)
                        : (lightMode ? Colors.black : Colors.white),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ]),
    );
  }
}

// App Bar which displays the name and picture of the receiver
class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  final String dpName;
  ChatAppBar(
      {@required this.title, @required this.appBar, @required this.dpName});

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
          Text(
            title,
            style: kHeadFontStyle.copyWith(
                fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: FlatButton(
              onPressed: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage('images/$dpName.png'),
                      fit: BoxFit.fill),
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
