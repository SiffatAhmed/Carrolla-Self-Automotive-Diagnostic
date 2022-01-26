import 'dart:convert';

import 'package:carrolla/models/DataManagement/DataCalculations.dart';
import 'package:carrolla/models/DataManagement/data.dart';
import 'package:flutter/material.dart';

class MainCompleteData extends StatefulWidget {
  const MainCompleteData({Key key}) : super(key: key);

  @override
  _MainCompleteDataState createState() => _MainCompleteDataState();
}

class _MainCompleteDataState extends State<MainCompleteData> {
  List<String> _tasks = [];
  List<String> code = [];
  List<Data> toDispDat = [];
  DataCalculations dataCalculations;
  void readDataFromJson() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString("assets/OtherFiles/code.json");
    final data = await json.decode(response);
    setState(() {
      toDispDat = [];
      for (var i = 0; i < data["Error_Codes"][0].length; i++) {
        _tasks.add(data["Error_Codes"][0][i][1]);
        code.add(data["Error_Codes"][0][i][0]);
      }
      dataCalculations = DataCalculations(data["Distance"][0], 55500);
      Data d1 = Data(
        instruction: "Distance Since DTC cleared (in KM)",
        number: dataCalculations.distanceSinceDTC,
      );
      Data d2 = Data(
        instruction: "Total Distance Driven (in KM)",
        number: dataCalculations.totalDistanceDriven,
      );
      Data d3 = Data(
        instruction: "Change Engine oil after (in KM)",
        number: dataCalculations.engineOilKM,
      );
      Data d4 = Data(
        instruction: "Change Break oil after (in KM)",
        number: dataCalculations.breakOilChangeKM,
      );
      Data d5 = Data(
        instruction: "Wheel alignemnt after (in KM)",
        number: dataCalculations.wheelAlignmentKM,
      );
      Data d6 = Data(
        instruction: "Time Since DTC Cleared (in Days)",
        number: dataCalculations.timeSinceDTC,
      );
      toDispDat.add(d1);
      toDispDat.add(d2);
      toDispDat.add(d3);
      toDispDat.add(d4);
      toDispDat.add(d5);
      toDispDat.add(d6);
    });
  }

  @override
  void initState() {
    readDataFromJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Maintenance State",
              style: TextStyle(
                color: Color.fromRGBO(0, 121, 140, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              height: MediaQuery.of(context).size.height * 0.45,
              child: toDispDat.length == 0
                  ? Center(
                      child: const Text("No data found try again"),
                    )
                  : ListView.builder(
                      itemCount: toDispDat.length,
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
                          child: ListTile(
                            title: Text(
                              toDispDat[index].instruction +
                                  " " +
                                  toDispDat[index].number.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const Text(
              "Error code wise ",
              style: TextStyle(
                color: Color.fromRGBO(0, 121, 140, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
              height: MediaQuery.of(context).size.height * 0.3,
              child: _tasks.length == 0
                  ? Center(
                      child: const Text("No data found try again"),
                    )
                  : ListView.builder(
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
                          child: ListTile(
                            title: Text(
                              _tasks[index],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
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
