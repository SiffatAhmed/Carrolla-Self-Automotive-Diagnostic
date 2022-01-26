import 'package:flutter/material.dart';

/*
*IMPORTANT INFORMATION IS HIGHLIGHTED
Upper part of login or signup page

*/
class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
          width: 100,
          child: Center(
            child: Image.asset("assets/Images/logo-01.png"),
          ),
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.70,
            height: MediaQuery.of(context).size.height * 0.10,
            child: FittedBox(
              child: Text(
                "Carrolla Self Diagnostic",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
