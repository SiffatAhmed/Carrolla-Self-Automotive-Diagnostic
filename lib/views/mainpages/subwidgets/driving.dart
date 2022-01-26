import 'dart:async';

import 'package:carrolla/main.dart';
import 'package:carrolla/models/drive/drive.dart';
import 'package:carrolla/models/mapdata.dart';
import 'package:flutter/material.dart';

Drive drive;

class Driving extends StatefulWidget {
  @override
  _DrivingState createState() => _DrivingState();
}

class _DrivingState extends State<Driving> {
  bool stopped = false;

  Timer timer;
  int timeinSec = 0;
  List<Mapdata> mappoints = [];
  // getPoints() async {
  //   while (stopped == false) {
  //     Timer.periodic(
  //       Duration(seconds: 5),
  //       (Timer t) {
  //         mappoints.add(Mapdata());
  //       },
  //     );
  //   }
  // }

  getPoints() async {
    mappoints.add(Mapdata());
    print(mapdata.longitude.toString() + "  " + mapdata.latitude.toString());
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      timeinSec += 5;
      getPoints();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your drive status and result"),
        backgroundColor: Color.fromRGBO(4, 47, 60, 1),
      ),
      body: stopped == false
          ? Container(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        stopped = true;
                      });
                      mappoints.add(Mapdata());
                      drive = Drive(drivePoints: mappoints, seconds: timeinSec);
                      print(drive.distance());
                      drive.totalTimer();
                    },
                    child: Text("Stop"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(54, 117, 136, 1),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02),
                      color: Color.fromRGBO(54, 117, 136, 1),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: FittedBox(
                        child: Text(
                          "You are driving your car total distance you will cover\n will be shown once you confirm that you've stopped",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // stopped = true;
                      // mappoints.add(Mapdata());
                      // drive = Drive(drivePoints: mappoints, seconds: timeinSec);
                      // print(drive.distance());
                      // drive.totalTimer();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Current drive is already stopped",
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    },
                    child: Text("Stopped"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(54, 117, 136, 1),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02),
                      color: Color.fromRGBO(54, 117, 136, 1),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: FittedBox(
                        child: Text(
                          "You are driving your car total distance you will cover\n will be shown once you confirm that you've stopped",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    // padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          title: Text(
                            "Distance Driven",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            drive.distance().toStringAsFixed(3) + " m",
                            style: TextStyle(color: Colors.white),
                          ),
                          tileColor: Color.fromRGBO(54, 117, 136, 1),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(2),
                          title: Text(
                            "Time Taken",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            drive.totalTimer().toString() + " s",
                            style: TextStyle(color: Colors.white),
                          ),
                          tileColor: Color.fromRGBO(54, 117, 136, 1),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.all(2),
                          title: Text(
                            "Distance per unit time",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            drive.speed().toStringAsFixed(3) + " m/s",
                            style: TextStyle(color: Colors.white),
                          ),
                          tileColor: Color.fromRGBO(54, 117, 136, 1),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        // Container(
                        //   height: MediaQuery.of(context).size.height * 0.1,
                        //   child: ListView.builder(
                        //     itemCount: mappoints.length,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return ListTile(
                        //         trailing: Row(
                        //           children: [
                        //             Text("Latitude : " +
                        //                 mappoints[index].latitude.toString()),
                        //             Text("Longitude : " +
                        //                 mappoints[index].longitude.toString()),
                        //           ],
                        //         ),
                        //       );
                        //       // title: Text("List item $index"));
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
