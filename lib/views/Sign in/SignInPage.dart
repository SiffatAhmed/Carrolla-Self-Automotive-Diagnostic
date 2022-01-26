import 'package:flutter/material.dart';
import 'package:carrolla/views/Sign In/InputWrapper.dart';

import 'Header.dart';

/*
*IMPORTANT INFORMATION IS HIGHLIGHTED
Login Page overall design completion

*/
class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(0, 121, 140, 1),
                  Color.fromRGBO(4, 47, 60, 1),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Header(),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: InputWrapper(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
