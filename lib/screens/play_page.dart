import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:klimaxapp/constants.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:klimaxapp/components.dart';
import 'package:klimaxapp/main.dart';
import 'package:fluttericon/typicons_icons.dart';

IconData likeIcon =
    FontAwesome.heart_empty; // To change the heart icon if pressed
bool play = false; // To check if play mode is on or off

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: FlatButton(
            onPressed: () {
              if (play)
                setState(() {
                  play = false;
                });
              else
                Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              height: 32.0,
              width: 32.0,
              child: Icon(
                Typicons.left_open,
                color: Colors.black,
                size: 17.0,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    // To change fill the heart icon when it is pressed upon
                    if (likeIcon == FontAwesome.heart_empty)
                      likeIcon = FontAwesome.heart;
                    else
                      likeIcon = FontAwesome.heart_empty;
                  });
                },
                icon: Icon(
                  likeIcon,
                  size: 20,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 350.0,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.darken,
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage('images/c1.jpeg'),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center)),
                  child: Stack(children: <Widget>[
                    GetGradient(
                        play), // To get black/white gradient as per the theme and whether play button is pressed
                    play // To display play button only when play mode is off
                        ? SizedBox.shrink()
                        : Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Center(
                              child: IconButton(
                                icon: Icon(
                                  FontAwesome5.play_circle,
                                  size: 60.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    play = true;
                                  });
                                },
                              ),
                            ),
                          ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          play
                              ? Text(
                                  'Now Playing',
                                  style: kHeadingFontStyle.copyWith(
                                      fontSize: 21.0, height: 1.5),
                                )
                              : Text(
                                  'For Life',
                                  style: kTabFontStyle.copyWith(
                                      color: Color(0xFF0055FF), fontSize: 20.0),
                                ),
                          Icon(
                            FontAwesome5.crown,
                            color: Color(0xFFFCCC14),
                          )
                        ],
                      ),
                      play
                          ? Text(
                              'For Life',
                              style: kTabFontStyle.copyWith(
                                  color: Color(0xFF0055FF), fontSize: 20.0),
                            )
                          : Text(
                              'American Broadcasting \nCompany',
                              style: kHeadingFontStyle.copyWith(
                                  fontSize: 21.0, height: 1.5),
                            ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      play // To view the description and rating or the viewers/comments as per the play mode
                          ? Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 30.0),
                              height: 350.0,
                              width: 500.0,
                              color: lightMode
                                  ? Color(0xFFF1EEEE)
                                  : Color(0xFF121212),
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                                child: ListView(
                                  // Horizontal, scrollable list to view viewers/comments
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                60.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Flex(
                                                direction: Axis.horizontal,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Text('Viewers (138)')
                                                ]),
                                            ViewTab(
                                              dp: 'm1',
                                              name: 'Marjorie Miles',
                                              text:
                                                  'I love this series sooooo much',
                                            ),
                                            ViewTab(
                                              dp: 'm7',
                                              name: 'Soham Hawkins',
                                              text: 'All time fav ❤️❤️',
                                            ),
                                            ViewTab(
                                              dp: 'm8',
                                              name: 'Philip Fisher',
                                              text:
                                                  'What\'s gon happen next?? 😁',
                                            ),
                                            ViewTab(
                                              dp: 'm6',
                                              name: 'Theresa Webb',
                                              text: '#For Life 💕',
                                            ),
                                          ],
                                        )),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                60.0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Flex(
                                                direction: Axis.horizontal,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text('Comments (1,039)')
                                                ]),
                                            ViewTab(
                                              dp: 'm1',
                                              name: 'Marjorie Mills',
                                              text:
                                                  'I was engaged and amazed at that plot! Definitely hope it stays that good for series to come',
                                            ),
                                            ViewTab(
                                              dp: 'm7',
                                              name: 'Soham Hawkins',
                                              text:
                                                  'Finally a refereshing TV show that isn\'n based on false eyelashes & squeaky voiced prima domas trying to make their mark.',
                                            ),
                                            ViewTab(
                                              dp: 'm8',
                                              name: 'Philip Fisher',
                                              text:
                                                  'A beautifully crafted narrative about the life of a man fighting for truth',
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: ListTile(
                                                title: Container(
                                                  height: 35.0,
                                                  width: double.maxFinite,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                          color: lightMode
                                                              ? Colors.black
                                                              : Colors.white),
                                                      color:
                                                          Colors.transparent),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            15.0,
                                                            8.0,
                                                            0.0,
                                                            0.0),
                                                    child: TextField(
                                                      style: kTabFontStyle
                                                          .copyWith(
                                                              fontSize: 13.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                      decoration:
                                                          InputDecoration(
                                                        isCollapsed: true,
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        isDense: true,
                                                        border:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none),
                                                        labelText: 'Comment',
                                                        labelStyle: kTabFontStyle
                                                            .copyWith(
                                                                fontSize: 13.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                trailing: Icon(Icons.send),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  Text(
                                    'A prisoner becomes a lawyer litigating cases for other inmates while fighting to overturn his own life sentence for a crime he didn\'t commit.',
                                    style: kSubheadFontStyle.copyWith(
                                        fontSize: 13.0),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        '4.5/5',
                                        style: kSubheadFontStyle.copyWith(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 18.0,
                                        color: Color(0xFFF0C933),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 18.0,
                                        color: Color(0xFFF0C933),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 18.0,
                                        color: Color(0xFFF0C933),
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 18.0,
                                        color: Color(0xFFF0C933),
                                      ),
                                      Icon(
                                        Icons.star_half,
                                        size: 18.0,
                                        color: Color(0xFFF0C933),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(height: 40.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                        child: GestureDetector(
                          onTap: () {
                            // To push to the profile page of American Broadcasting channel when MORE FROM THIS CHANNEL is pressed
                            Navigator.pushNamed(context, '/abc');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'MORE FROM THIS CHANNEL',
                                style: kTabFontStyle,
                              ),
                              Icon(
                                LineariconsFree.arrow_right,
                                size: 20.0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                        margin: EdgeInsets.only(top: 20.0),
                        height: 280.0,
                        child: ListView.separated(
                          // Horizontal, scrollable list to view more shows from the channel
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget to get gradient over the background image according to the play mode
class GetGradient extends StatelessWidget {
  final bool playButtonPressed;
  GetGradient(this.playButtonPressed);
  @override
  Widget build(BuildContext context) {
    double returnPoint = 0.1;
    if (playButtonPressed) returnPoint = 0.9;
    return Container(
      height: 350.0,
      decoration: BoxDecoration(
          color: dependent,
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.transparent.withOpacity(playButtonPressed ? 0.0 : 0.3),
                dependent,
              ],
              stops: [
                returnPoint,
                1.0
              ])),
    );
  }
}

// ListTile widget to display viewers or comments with their names, pictures and comments
class ViewTab extends StatelessWidget {
  final String dp, name, text;
  ViewTab({
    @required this.dp,
    @required this.name,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      leading: Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$dp.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0)),
      ),
      title: Container(
        height: 30.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: kHeadingFontStyle.copyWith(fontSize: 12.0),
            ),
            Flexible(
              child: Container(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: kSubheadFontStyle.copyWith(
                      letterSpacing: 0.3,
                      fontSize: 9.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
