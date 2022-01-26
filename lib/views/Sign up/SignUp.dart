import 'package:flutter/material.dart';
import 'package:carrolla/views/Sign up/SignUpPage.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.indigo,
      // ),
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
