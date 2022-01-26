import 'dart:convert';

import 'package:carrolla/views/CommonWidgets/GuestUser.dart';
import 'package:carrolla/views/marketplace/loader.dart';
import 'package:carrolla/main.dart';
import 'package:flutter/material.dart';

/*
*IMPORTANT INFORMATION IS HIGHLIGHTED
Logic of how carrepair page will be displayed. Uses ListView builder.
Uses card and list checkedtileview mainly

*/
class CarRepair extends StatefulWidget {
  @override
  _CarRepairState createState() => _CarRepairState();
}

class _CarRepairState extends State<CarRepair> {
  List<String> _tasks = [];
  List<String> code = [];
  List _values = [];
  void readDataFromJson() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString("assets/OtherFiles/code.json");
    final data = await json.decode(response);
    setState(() {
      _tasks.add(data["Error_Codes"][0][0][1]);
      code.add(data["Error_Codes"][0][0][0]);
      _tasks.add(data["Error_Codes"][0][1][1]);
      code.add(data["Error_Codes"][0][1][0]);
      for (var i = 0; i < _tasks.length; i++) {
        _values.add(false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    readDataFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(5),
                color: Color.fromRGBO(54, 117, 136, 1),
                child: guestUser == true
                    ? GuestUser()
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MarketPlaceHomePage()),
                          );
                        },
                        child: Text(
                          "Open Marketplace",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.737,
              child: _tasks.length == 0
                  ? Center(child: Text("List is Empty"))
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return Card(
                          // color: Color(0x36e7f4),
                          color: Color.fromRGBO(54, 117, 136, 1),
                          elevation: 1,
                          margin: EdgeInsets.symmetric(
                            vertical: 1,
                            horizontal: 0.1,
                          ),
                          child: CheckboxListTile(
                            //activeColor: Colors.white,
                            checkColor: Colors.yellow,
                            //tileColor: Color.fromRGBO(0, 0, 125, 0),
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
                            subtitle: Text(
                              code[index] + " Error Code",
                              style: TextStyle(
                                color: Colors.white60,
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
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
