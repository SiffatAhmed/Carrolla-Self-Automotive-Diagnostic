import 'package:flutter/cupertino.dart';

class LogData {
  var vinNumber;
  var totalDistanceDriven;
  var distanceSinceLastMaintenance;
  var engineOilChangeKM;
  var engineOilChangeDate;
  var wheelAlignmentKM;
  var timeSinceDTCcodesCleared;
  LogData({
    @required this.vinNumber,
    @required this.totalDistanceDriven,
    @required this.distanceSinceLastMaintenance,
    @required this.engineOilChangeKM,
    @required this.engineOilChangeDate,
    @required this.wheelAlignmentKM,
    @required this.timeSinceDTCcodesCleared,
  });
}
