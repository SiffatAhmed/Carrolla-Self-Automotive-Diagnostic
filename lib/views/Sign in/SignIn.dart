import 'package:flutter/material.dart';
import 'package:carrolla/views/Sign in/SignInPage.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.indigo,
      // ),
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
