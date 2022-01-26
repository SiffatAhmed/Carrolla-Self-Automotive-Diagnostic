import 'package:geolocator/geolocator.dart';

class Mapdata {
  var latitude;
  var longitude;
  Mapdata() {
    getUser();
  }
  void getUser() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
