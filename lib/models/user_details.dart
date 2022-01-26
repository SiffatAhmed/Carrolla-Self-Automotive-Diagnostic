import 'package:flutter/cupertino.dart';

class UserDetails {
  String userName;
  String email;
  String photo;

  UserDetails.empty();
  UserDetails({
    @required this.userName,
    @required this.email,
    this.photo,
  });
}
