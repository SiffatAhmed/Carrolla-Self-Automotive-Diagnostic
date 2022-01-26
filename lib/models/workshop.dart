import 'package:flutter/cupertino.dart';

class Workshop {
  String workshopID;
  String name;
  String address;
  var latlong;

  Workshop({
    @required this.workshopID,
    @required this.name,
    @required this.address,
    @required this.latlong,
  });
}
