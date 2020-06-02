import 'package:flutter/material.dart';
import 'package:klimaxapp/components.dart';
import 'package:klimaxapp/constants.dart';
import 'chat_page.dart';

// Messages Page to show the ongoing chats of the user
class MessagesPage extends StatelessWidget {
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
            title: 'Messages',
            appBar: AppBar(),
          ),
          body: ListView(
            // Horizontal, scrollable list to show chat with different people
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              ChatTab(
                dp: 'm1',
                name: 'Marjorie Miles',
                text: 'Great. What do you think about the series For Life?',
                time: '5m',
                unread: 1,
              ),
              ChatTab(
                dp: 'm2',
                name: 'Devon Fisher',
                text: '😂😂',
                time: '5m',
                unread: 3,
              ),
              ChatTab(
                dp: 'm3',
                name: 'Eleanor Steward',
                text: 'You: Heyy girl',
                time: '10m',
                unread: 0,
              ),
              ChatTab(
                dp: 'm4',
                name: 'Esther Nguyen',
                text: 'is typing...',
                time: '1hr',
                unread: 0,
              ),
              ChatTab(
                dp: 'm5',
                name: 'Gregory Wilson',
                text: 'Thank you so much',
                time: '2hrs',
                unread: 10,
              ),
              ChatTab(
                dp: 'm6',
                name: 'Theresa Webb',
                text: 'Yeah',
                time: 'Yesterday',
                unread: 0,
              ),
              ChatTab(
                dp: 'm7',
                name: 'Soham Hawkins',
                text: 'See you then...',
                time: 'Friday',
                unread: 1,
              ),
              ChatTab(
                dp: 'm8',
                name: 'Philip Fisher',
                text: 'It is an unbelievable movie!',
                time: 'Friday',
                unread: 10,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigatorBar(
            pressedIconName: 'messages',
          ),
        ),
      ),
    );
  }
}

// ListTile Widget to display each chat tab for every person
// Takes name, imageFilename, lastText, unreadTexts (if any) and time as the input
class ChatTab extends StatelessWidget {
  final String dp, name, text, time;
  final int unread;
  ChatTab(
      {@required this.dp,
      @required this.name,
      this.time,
      @required this.text,
      this.unread = 0});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatPage(
            dpName: dp,
            name: name,
          );
        }));
      },
      leading: Container(
        height: 58.0,
        width: 58.0,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$dp.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20.0)),
      ),
      title: Container(
        height: 53.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: kHeadingFontStyle,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: kSubheadFontStyle.copyWith(
                        letterSpacing: 0.3,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '.$time',
                  overflow: TextOverflow.ellipsis,
                  style: kSubheadFontStyle.copyWith(
                      fontSize: 11.0, fontWeight: FontWeight.w300),
                ),
              ],
            )
          ],
        ),
      ),
      trailing: unread != 0
          ? Container(
              height: 20.0,
              width: 20.0,
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFF0055FF)),
              child: Center(
                child: Text(
                  unread > 9
                      ? '9+'
                      : '$unread', // To display 9+ if the unread messages are in double digits
                  style: kSubheadFontStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            )
          : null,
    );
  }
}
