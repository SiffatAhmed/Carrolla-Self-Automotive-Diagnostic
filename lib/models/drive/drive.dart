import 'package:carrolla/models/mapdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class Drive {
  List<Mapdata> drivePoints = [];
  int seconds;
  Drive({
    @required this.drivePoints,
    @required this.seconds,
  });

  double distance() {
    double dist = 0;
    for (int i = 1; i < this.drivePoints.length - 1; i++) {
      if (drivePoints[i].latitude != null &&
          drivePoints[i].longitude != null &&
          drivePoints[i + 1].latitude != null &&
          drivePoints[i + 1].longitude != null)
        dist += Geolocator.distanceBetween(
            drivePoints[i].latitude,
            drivePoints[i].longitude,
            drivePoints[i + 1].latitude,
            drivePoints[i + 1].longitude);
    }
    print(dist);
    return dist;
  }

  int totalTimer() {
    print(seconds);
    return seconds;
  }

  double speed() {
    double speed = 0;
    speed = distance() / totalTimer();
    return speed;
  }
}
