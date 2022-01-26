import 'package:flutter/cupertino.dart';

class OBDdata {
  List errorCodes;
  double distanceSinceDTCcodesCleared;
  OBDdata({
    @required this.errorCodes,
    @required this.distanceSinceDTCcodesCleared,
  });

  // OBDdata.fromJson(Map<double, dynamic> json)
  //     : distanceSinceDTCcodesCleared = json['Distance'][0],
  //       errorCodes = json['Error_Codes'];
  // OBDdata() {
  //   // print(this.distanceSinceDTCcodesCleared);
  //   // print(this.errorCodes);
  //   // readDistFromJson();
  //   // readFaultFromJson();
  // }

  // void readDistFromJson() async {
  //   final String response =
  //       await rootBundle.loadString("assets/OtherFiles/code.json");
  //   final data = await json.decode(response);
  //   distanceSinceDTCcodesCleared = data['Distance'][0];
  //   // dist(data['Distance'][0]);
  // }

  // double dist(double distance) {
  //   return distance;
  // }

  // void readFaultFromJson() async {
  //   final String response =
  //       await rootBundle.loadString("assets/OtherFiles/code.json");
  //   final data = await json.decode(response);
  //   errorCodes = data["Error_Codes"][0];
  //   // print(this.errorCodes);
  // }

  // List codes(List code) {
  //   return codes(code);
  // }
}
