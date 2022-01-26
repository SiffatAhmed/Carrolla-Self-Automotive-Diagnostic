import 'dart:async';

import 'package:flutter/material.dart';

import 'package:carrolla/views/CommonWidgets/exitButton.dart';
import 'package:carrolla/views/datasideofviews/dataView.dart';
import 'package:carrolla/views/mainpages/guideTowardsMap.dart';
import 'package:carrolla/views/mainpages/notificationsPage.dart';
import 'package:carrolla/views/mainpages/settings.dart';
import 'package:carrolla/views/mainpages/subwidgets/driving.dart';

import 'CarRepair.dart';
import 'Homepage.dart';

/*
*IMPORTANT INFORMATION IS HIGHLIGHTED
Manages logic of bottom navbar for moving across pages.
*/

class PageBody extends StatefulWidget {
  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  int _selectedIndex = 0;
  String _title = "Home";
  Widget _page;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        switch (index) {
          case 0:
            {
              _title = "Home";

              _page = HomeWidget();
            }
            break;
          case 1:
            {
              _title = "Car Repair";
              _page = CarRepair();
            }
            break;
          case 2:
            {
              _title = "Workshop in area";
              _page = GuideMap();
            }
            break;
          case 3:
            {
              _title = "Notifications";
              _page = NotificationPage();
            }
            break;
          case 4:
            {
              _title = "Settings";
              _page = SettingsPage();
            }
            break;
        }
      },
    );
  }

  @override
  void initState() {
    _title = "Home";
    _page = HomeWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(4, 47, 60, 1),
        title: Text(_title),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Are you driving your car?"),
                    actions: [
                      Container(
                        color: Color.fromRGBO(4, 47, 60, 1),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Driving(),
                              ),
                            );
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.car_rental),
          ),
          IconButton(
            icon: Icon(Icons.bluetooth),
            onPressed: () {
              Future.delayed(Duration(seconds: 4), () {});
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataView(),
                ),
              );
            },
          ),
          ExitButton(),
        ],
      ),
      body: Center(
        child: _page,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(4, 47, 60, 1),
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair),
            label: 'Car Repair',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: 'Map',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_rounded),
            label: 'Notifications',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
