import 'package:flutter/material.dart';

import 'package:carrolla/main.dart';
import 'package:carrolla/views/CommonWidgets/GuestUser.dart';
import 'package:carrolla/views/CommonWidgets/exitButton.dart';
import 'package:carrolla/views/SearchCode/OBDSearcher.dart';
import 'package:carrolla/views/datasideofviews/UpdateRepairEvent/updateRepairEvent.dart';
import 'package:carrolla/views/datasideofviews/completeData/mainCompData.dart';
import 'package:carrolla/views/datasideofviews/graphicalView/graphicalView.dart';

class DataView extends StatefulWidget {
  @override
  _DataViewState createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  int currentIndex = 0;
  String title = "Complete Data";
  Widget _widget = MainCompleteData();
  void onItemTapped(int index) {
    setState(
      () {
        currentIndex = index;
        switch (index) {
          case 0:
            {
              title = "Complete Data";
              _widget = guestUser == true
                  ? Center(
                      child: Container(
                        child: Text(
                          "This Feature is for Registered Users Only.",
                        ),
                      ),
                    )
                  : MainCompleteData();
            }
            break;
          case 1:
            {
              title = "Graphical View";
              _widget = guestUser == true
                  ? Center(
                      child: Container(
                        child: Text(
                          "This Feature is for Registered Users Only.",
                        ),
                      ),
                    )
                  : GraphicalView();
            }
            break;
          case 2:
            {
              title = "Search Fault Codes";
              _widget = Search();
            }
            break;
          // case 3:
          //   {
          //     title = "Update Repair Event";
          //     _widget = UpdateRepairEvent();
          //   }
          // break;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    title = "Complete Data";
    _widget = guestUser == true
        ? Center(
            child: Container(
              child: Text(
                "This Feature is for Registered Users Only.",
              ),
            ),
          )
        : MainCompleteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(4, 47, 60, 1),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          ExitButton(),
        ],
      ),
      body: _widget,
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(4, 47, 60, 1),
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Complete Data',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Graphical View',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'Fault Codes',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        onTap: onItemTapped,
      ),
    );
  }
}
