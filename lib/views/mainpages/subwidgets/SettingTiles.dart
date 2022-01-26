import 'package:carrolla/views/PrivacyPolicy/PrivacyPolicy.dart';
import 'package:carrolla/views/TOSpage/tosPage.dart';
import 'package:carrolla/views/HelpPage/HelpPage.dart';
import 'package:flutter/material.dart';

class SettingTiles extends StatelessWidget {
  const SettingTiles({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Card(
            color: Color.fromRGBO(54, 117, 136, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: ListTile(
              title: Text(
                "Privacy Policy",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_rounded),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              },
            ),
          ),
          Card(
            color: Color.fromRGBO(54, 117, 136, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: ListTile(
              title: Text(
                "Terms of Service",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TosMainPage(),
                  ),
                );
              },
            ),
          ),
          Card(
            color: Color.fromRGBO(54, 117, 136, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: ListTile(
              title: Text(
                "Help ?",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpPage(),
                  ),
                );
              },
            ),
          ),
          // YoutubePlayers(),
        ],
      ),
    );
  }
}
