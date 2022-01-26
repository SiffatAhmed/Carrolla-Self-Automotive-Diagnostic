import 'package:flutter/material.dart';

class GuestUser extends StatelessWidget {
  const GuestUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: Color.fromRGBO(4, 47, 60, 1),
                  content: Text(
                    "Become registered user to access marketplace",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  actions: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Ok",
                        style: TextStyle(
                          color: Color.fromRGBO(4, 47, 60, 1),
                        ),
                      ),
                    ),
                  ],
                ));
      },
      child: Text(
        "Open Marketplace",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
