import 'dart:convert';

import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> _tasks = [];
  List _values = [];
  void readDataFromJson() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString("assets/OtherFiles/code.json");
    final data = await json.decode(response);
    setState(() {
      _tasks.add(data["Error_Codes"][0][0][1]);
      _tasks.add(data["Error_Codes"][0][1][1]);
      for (var i = 0; i < _tasks.length; i++) {
        _values.add(false);
      }
    });
  }

  @override
  void initState() {
    readDataFromJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Card(
            color: Color.fromRGBO(54, 117, 136, 1),
            elevation: 1,
            margin: EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 0.1,
            ),
            child: CheckboxListTile(
              value: _values.elementAt(index),
              //contentPadding: EdgeInsets.all(5),
              title: Text(
                _tasks[index],
                style: TextStyle(
                  color: Colors.white,
                  decoration: _values[index]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(
                  () {
                    _values[index] = value;
                    _values.removeAt(index);
                    _tasks.removeAt(index);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
