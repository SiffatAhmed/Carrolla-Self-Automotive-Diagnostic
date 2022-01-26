// import 'package:carrolla/views/Login/SignUp.dart';

import 'package:carrolla/views/mainpages/pageBody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
// import 'user_details.dart';

/*
*IMPORTANT INFORMATION IS HIGHLIGHTED
Google Authentication Logic

*/

class GoogleSignInProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signup({String email, String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signIn({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> googleLogin(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      //User user = result.user;
      // this._userdetails = new UserDetails(
      //     userName: user.displayName,
      //     email: user.email,
      //     phoneNumber: user.phoneNumber);

      if (result != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PageBody(),
          ),
        );
      }
    }
  }
}
