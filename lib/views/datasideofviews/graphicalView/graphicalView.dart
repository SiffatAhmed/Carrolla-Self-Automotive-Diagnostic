import 'dart:convert';

import 'package:carrolla/models/DataManagement/DataCalculations.dart';
import 'package:carrolla/models/DataManagement/DataCalculationsPercentage.dart';
import 'package:carrolla/models/DataManagement/datapercent.dart';
import 'package:flutter/material.dart';

class GraphicalView extends StatefulWidget {
  const GraphicalView({Key key}) : super(key: key);

  @override
  _GraphicalViewState createState() => _GraphicalViewState();
}

class _GraphicalViewState extends State<GraphicalView> {
  List<String> _tasks = [];
  List<String> code = [];
  DataCalculations dataCalculations;
  DataCalculationsPercentage dcp;
  DataPercent d1, d2, d3, d4;
  List<DataPercent> dps = [];
  void readDataFromJson() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString("assets/OtherFiles/code.json");
    final data = await json.decode(response);
    setState(() {
      for (var i = 0; i < data["Error_Codes"][0].length; i++) {
        _tasks.add(data["Error_Codes"][0][i][1]);
        code.add(data["Error_Codes"][0][i][0]);
      }
      dataCalculations = DataCalculations(data["Distance"][0], 555000);
      dcp = DataCalculationsPercentage(
        dataCalculations.totalDistanceDriven,
        dataCalculations.engineOilKM,
        dataCalculations.breakOilChangeKM,
        dataCalculations.wheelAlignmentKM,
      );
    });
    d1 = DataPercent(
      instruction: "DTC cleared",
      number: dcp.totalDistanceDrivenPercent,
      col: Colors.red,
    );
    d2 = DataPercent(
      instruction: "Engine Oil",
      number: dcp.engineOilKMPercent,
      col: Colors.indigo,
    );
    d3 = DataPercent(
      instruction: "Break Oil",
      number: dcp.breakOilChangeKMPercent,
      col: Colors.blue,
    );
    d4 = DataPercent(
      instruction: "Wheel Alignment",
      number: dcp.wheelAlignmentKMPercent,
      col: Colors.indigo,
    );
  }

  @override
  void initState() {
    readDataFromJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Car Maintenance Update",
                style: TextStyle(
                  color: Color.fromRGBO(0, 121, 140, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              color: Colors.white70,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: const Text(
                      "Percent of Life consumed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 121, 140, 1),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 100 / 1080),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.red,
                          child: Text(
                            d1.number == null
                                ? 0
                                : (d1.number * 100).toStringAsFixed(1) + '%',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          height: d1.number == null
                              ? 0
                              : (MediaQuery.of(context).size.height * 0.5) *
                                  d1.number,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Text(d1.instruction),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.green,
                          child: Text(
                            d2.number == null
                                ? 0
                                : (d2.number * 100).toStringAsFixed(1) + '%',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          height: d2.number == null
                              ? 0
                              : (MediaQuery.of(context).size.height * 0.5) *
                                  d2.number,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Text(d2.instruction),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.blue,
                          child: Text(
                            d3.number == null
                                ? 0
                                : (d3.number * 100).toStringAsFixed(1) + '%',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          height: d3.number == null
                              ? d3.number = 0
                              : (MediaQuery.of(context).size.height * 0.5) *
                                  d3.number,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Text(d3.instruction),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.indigo,
                          child: Text(
                            d4.number == null
                                ? 0
                                : (d4.number * 100).toStringAsFixed(1) + '%',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          height: d4.number == null
                              ? 0
                              : (MediaQuery.of(context).size.height * 0.5) *
                                  d4.number,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Text(d4.instruction),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
