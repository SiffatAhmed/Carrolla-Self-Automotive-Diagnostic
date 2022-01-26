import 'package:carrolla/views/mainpages/mappage.dart';
import 'package:flutter/material.dart';

class GuideMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          color: Color.fromRGBO(54, 117, 136, 1),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapsPage(),
                ),
              );
            },
            child: Text(
              "View Workshops around You",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
