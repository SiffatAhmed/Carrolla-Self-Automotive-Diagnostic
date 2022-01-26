import 'dart:async';

import 'package:carrolla/main.dart';
import 'package:carrolla/models/firebaseInteraction/workshopFB.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  WorkshopFB workshopFB;
  List workshops = [];
  initialise() {
    workshopFB = WorkshopFB();
    workshopFB.initialise();
    workshopFB.read().then((value) => {
          setState(() {
            workshops = value;
            print("Values : $value");
            print(value.length);

            print("workshops : $workshops");
            print(workshops.length);
            for (var i = 0; i < workshops.length; i++) {
              print('Length' + (workshops.length.toString()));
              print(workshops[i].name.runtimeType);
              print(workshops[i].latlong.runtimeType);
              print(workshops[i].address.runtimeType);

              String name = workshops[i].name;
              var latlong = workshops[i].latlong;
              var lat = latlong.latitude;
              var long = latlong.longitude;
              String addr = workshops[i].address;
              allMarkers.add(
                Marker(
                  markerId: MarkerId(name),
                  position: LatLng(lat, long),
                  infoWindow: InfoWindow(title: addr),
                ),
              );
            }
          })
        });
    // for (var index in workshops) {
    //   print(workshops.length);
    //   print(index);
    //   allMarkers.add(
    //     Marker(
    //       markerId: MarkerId(index.name),
    //       // markerId: MarkerId("132"),
    //       position: LatLng(index.longitude, index.latitude),
    //       infoWindow: InfoWindow(
    //         title: index.address,
    //       ),
    //     ),
    // );

    // print("Workshop:  $index");
    // var x = workshops[index]['longitude'];
    // // print(x is double);
    // }
  }

  List<Marker> allMarkers = [];
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    // initialise();

    super.initState();
    if (mapdata.latitude == null || mapdata.longitude == null) {
      mapdata.latitude = 33.7151558;
      mapdata.longitude = 73.0300691;
    }
    allMarkers.add(
      Marker(
        markerId: MarkerId("Babar Auto Workshop"),
        position: LatLng(33.71728189627616, 73.04283168156779),
        infoWindow: InfoWindow(title: "Babar Auto Workshop H-9"),
      ),
    );
    allMarkers.add(
      Marker(
        markerId: MarkerId("Shah Auto Workshop"),
        position: LatLng(33.684263540943675, 73.04013193816196),
        infoWindow: InfoWindow(
          title: "Shah Auto Workshop I&T center G-9/4",
        ),
      ),
    );
    allMarkers.add(
      Marker(
        markerId: MarkerId("Auto Workshop | Yaseen Autos"),
        position: LatLng(33.68101291785887, 73.03444986523351),
        infoWindow: InfoWindow(
          title: "Auto Workshop | Yaseen Autos",
        ),
      ),
    );
    allMarkers.add(
      Marker(
        markerId: MarkerId("Babu Auto"),
        position: LatLng(33.6775848549114, 73.04020296407357),
        infoWindow: InfoWindow(
          title: "Babu Auto",
        ),
      ),
    );
    allMarkers.add(
      Marker(
        markerId: MarkerId("Shift Car Studio"),
        position: LatLng(33.688045929437585, 73.0343078134103),
        infoWindow: InfoWindow(
          title: "Shift Car Studio",
        ),
      ),
    );
    allMarkers.add(
      Marker(
        markerId: MarkerId("Zohaib Auto Workshop"),
        position: LatLng(33.688134253885636, 73.0330149123758),
        infoWindow: InfoWindow(
          title: "Zohaib Auto Workshop",
        ),
      ),
    );
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    tilt: 59.440717697143555,
    bearing: 192.8334901395799,
    target: LatLng(30.3753, 69.3451),
    zoom: 5,
  );

  static CameraPosition _currentLocation = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(mapdata.latitude, mapdata.longitude),
    tilt: 59.440717697143555,
    zoom: 15,
  );
  Future<void> currenLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_currentLocation));
    setState(() {
      allMarkers.add(
        Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
          markerId: MarkerId("Your Location"),
          position: LatLng(_currentLocation.target.latitude,
              _currentLocation.target.longitude),
          // position: LatLng(mapdata.longitude, mapdata.latitude),
          infoWindow: InfoWindow(title: "This is your current location"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workshops around you"),
        backgroundColor: Color.fromRGBO(4, 47, 60, 1),
      ),
      floatingActionButton: Align(
        alignment: Alignment(-0.7, 0.9),
        child: FloatingActionButton(
          child: Icon(Icons.location_pin),
          onPressed: currenLocation,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          myLocationButtonEnabled: true,
          rotateGesturesEnabled: true,
          zoomControlsEnabled: true,
          compassEnabled: true,
          trafficEnabled: true,
          indoorViewEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            currenLocation();
          },
          // markers: Set.from(allMarkers),
          markers: Set<Marker>.of(allMarkers),
        ),
      ),
    );
  }
}
