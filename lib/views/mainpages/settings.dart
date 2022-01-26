import 'package:carrolla/views/Sign up/InputWrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:carrolla/models/user_details.dart';
import 'subwidgets/currentUserProfile.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final UserDetails _userDetails = UserDetails(
    userName: FirebaseAuth.instance.currentUser.displayName == null
        ? email.toString().split("@").toString()
        : email.toString().split("@").toString() == null
            ? ""
            : email.toString().split("@").toString(),
    email: email.toString() == null ? "" : email.toString(),
    photo: FirebaseAuth.instance.currentUser == null
        ? null
        : FirebaseAuth.instance.currentUser.photoURL,
  );

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CurrentUserProfile(
        userDetails: _userDetails != null
            ? _userDetails
            : UserDetails(
                userName: email.toString().split("@").toString(),
                email: email.toString(),
              ),
      ),
    );
  }
}
