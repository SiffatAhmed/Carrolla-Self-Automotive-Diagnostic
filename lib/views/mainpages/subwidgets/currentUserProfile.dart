import 'package:flutter/material.dart';
import 'package:carrolla/models/user_details.dart';
import "package:carrolla/views/mainpages/subwidgets/SettingTiles.dart";

class CurrentUserProfile extends StatelessWidget {
  const CurrentUserProfile({
    Key key,
    @required UserDetails userDetails,
  })  : _userDetails = userDetails,
        super(key: key);

  final UserDetails _userDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
          height: MediaQuery.of(context).size.height * 0.1,
          child: Column(
            children: [
              Card(
                color: Color.fromRGBO(54, 117, 136, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                child: Row(
                  children: [
                    _userDetails.photo == null
                        ? CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 20,
                            child: Container(
                              child: Text(
                                _userDetails.email[0].toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.red,
                            ),
                          )
                        : CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(_userDetails.photo),
                            backgroundColor: Colors.transparent,
                          ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              _userDetails.userName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              _userDetails.email,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SettingTiles(),
      ],
    );
  }
}
