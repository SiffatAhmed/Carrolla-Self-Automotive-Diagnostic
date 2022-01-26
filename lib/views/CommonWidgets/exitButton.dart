import 'dart:io';

import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  const ExitButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.exit_to_app_rounded),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Exit app',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              content: Text(
                'Are you sure your want to exit app?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.black,
              actions: [
                Container(
                  color: Colors.red,
                  child: TextButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: Text(
                      'Quit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Color.fromRGBO(34, 139, 39, 1),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Stay in app',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
