import 'package:carrolla/models/google_sign_in.dart';
import 'package:carrolla/models/useraccountEmail.dart';
import 'package:carrolla/main.dart';
import 'package:carrolla/views/Sign up/Signupbutton.dart';
import 'package:carrolla/views/Sign%20in/SignIn.dart';
import 'package:carrolla/views/carProfile/CarProfile.dart';
import 'package:carrolla/views/mainpages/pageBody.dart';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

/*
*IMPORTANT INFORMATION IS HIGHLIGHTED
Management of Sign up screen
*/

class InputWrapper extends StatefulWidget {
  @override
  _InputWrapperState createState() => _InputWrapperState();
}

UserAccount _userAccount = UserAccount();
TextEditingController email;

TextEditingController password;

class _InputWrapperState extends State<InputWrapper> {
  bool isEmail(String input) => EmailValidator.validate(input);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            //child: InputField(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.037,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    "Register Account",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 121, 140, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        enabled: true,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 121, 140, 1),
                        ),
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(0, 121, 140, 1),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(0, 121, 140, 1)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(0, 121, 140, 1)),
                          ),
                          hintText: "Enter email address (username@email.com)",
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 121, 140, 1),
                          ),
                        ),
                        validator: (value) {
                          if (!EmailValidator.validate(value)) {
                            return "Invalid email format";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (String value) {
                          _userAccount.email = value;
                        },
                        controller: email,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 121, 140, 1),
                        ),
                        decoration: InputDecoration(
                          enabled: true,
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(0, 121, 140, 1),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(0, 121, 140, 1),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(0, 121, 140, 1),
                            ),
                          ),
                          hintText: "Enter your password",
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 121, 140, 1),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter valid password';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          _userAccount.password = value;
                        },
                        controller: password,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.515,
                        color: Color.fromRGBO(0, 121, 140, 1),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              GoogleSignInProvider()
                                  .signup(
                                      email: _userAccount.email,
                                      password: _userAccount.password)
                                  .then((result) {
                                if (result == null) {
                                  GoogleSignInProvider().signIn(
                                    email: _userAccount.email,
                                    password: _userAccount.password,
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CarProfile(),
                                    ),
                                  );
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      result,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ));
                                }
                              });
                            }
                          },
                          child: FittedBox(
                            child: Text(
                              "Register Account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            child: LoginButton(),
          ),
          SizedBox(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              child: Text(
                "Sign In to account",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          SizedBox(
            child: TextButton(
              onPressed: () {
                guestUser = true;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageBody()));
              },
              child: Text(
                "Continue as Guest User",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
