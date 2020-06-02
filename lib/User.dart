import 'package:flutter/material.dart';

// A user class to create user objects to store data related to the user
class User {
  int followers,
      following; // To store the number of followers and following of the user
  String name; // To store the name of the user
  String displayPictureFilename; // To store the filename of user's DP
  User(
      {this.followers = 0,
      this.following = 0,
      @required this.name,
      @required this.displayPictureFilename});
}
