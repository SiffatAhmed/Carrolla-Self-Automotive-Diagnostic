import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:carrolla/models/google_sign_in.dart';
import 'package:provider/provider.dart';

/*
*IMPORTANT INFORMATION IS HIGHLIGHTED
Login Button design and onpressed logic

*/
class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.515,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color.fromRGBO(0, 121, 140, 1),
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin(context);
              },
              icon: Icon(
                FontAwesomeIcons.googlePlus,
              ),
              label: Text(
                "Continue with Google",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
