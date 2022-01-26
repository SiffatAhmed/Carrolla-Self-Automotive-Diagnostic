import 'package:carrolla/models/google_sign_in.dart';
import 'package:carrolla/models/useraccountEmail.dart';
import 'package:carrolla/main.dart';
import 'package:carrolla/views/Sign in/SignInButton.dart';
import 'package:carrolla/views/Sign%20up/SignUp.dart';
import 'package:carrolla/views/mainpages/pageBody.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

/*
*IMPORTANT INFORMATION IS HIGHLIGHTED
Lower portion of Login Button

*/

class InputWrapper extends StatefulWidget {
  @override
  _InputWrapperState createState() => _InputWrapperState();
}

UserAccount _userAccount = UserAccount();
TextEditingController email;

TextEditingController password;

class _InputWrapperState extends State<InputWrapper> {
  // bool validmail = false;
  // bool validuser = false;
  // bool validpass = false;

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
              children: [
                FittedBox(
                  child: Text(
                    "Sign In",
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
                        height: 10,
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
                        height: 10,
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
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.515,
                        color: Color.fromRGBO(0, 121, 140, 1),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              GoogleSignInProvider()
                                  .signIn(
                                      email: _userAccount.email,
                                      password: _userAccount.password)
                                  .then((result) {
                                if (result == null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PageBody(),
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
                          child: Text(
                            "Sign In",
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
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text(
                "Register account",
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
