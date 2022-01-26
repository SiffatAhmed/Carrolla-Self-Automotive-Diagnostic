import 'package:carrolla/views/mainpages/pageBody.dart';
import 'package:flutter/material.dart';
import 'package:carrolla/models/carProfileData.dart';
import 'package:carrolla/models/firebaseInteraction/CarProfileDataFB.dart';
import 'package:flutter/services.dart';

CarProfileData carProfileData;

class CarProfile extends StatefulWidget {
  const CarProfile({Key key}) : super(key: key);

  @override
  _CarProfileState createState() => _CarProfileState();
}

// late TextEditingController vinNumber;

// late TextEditingController kmDriven;

class _CarProfileState extends State<CarProfile> {
  final _formKey = GlobalKey<FormState>();
  var vinnumber;
  var kmdriven;
  var kmdrivensincelastmaintenance;
  // CarProfileData carProfileData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(4, 47, 60, 1),
          title: const Text("Car Profile"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //child: InputField(),
                ),
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.037,
                  child: Column(
                    children: [
                      const Text(
                        "Car Profiling",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 121, 140, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.3,
                  height: 300,
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(17),
                              ],
                              keyboardType: TextInputType.emailAddress,
                              enabled: true,
                              style: const TextStyle(
                                color: Color.fromRGBO(0, 121, 140, 1),
                              ),
                              decoration: const InputDecoration(
                                labelText: "VIN Number",
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(0, 121, 140, 1),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(0, 121, 140, 1)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(0, 121, 140, 1)),
                                ),
                                hintText: "Enter VIN number of your car",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(0, 121, 140, 1),
                                ),
                              ),
                              onChanged: (value) {
                                vinnumber = value;
                              },
                              // controller: vinNumber,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                color: Color.fromRGBO(0, 121, 140, 1),
                              ),
                              decoration: const InputDecoration(
                                enabled: true,
                                labelText: "Car Driven",
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(0, 121, 140, 1),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 121, 140, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 121, 140, 1),
                                  ),
                                ),
                                hintText:
                                    "Enter your Car's Odometer covered kilometers",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(0, 121, 140, 1),
                                ),
                              ),

                              onChanged: (value) {
                                kmdriven = value;
                              },
                              // controller: kmDriven,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                color: Color.fromRGBO(0, 121, 140, 1),
                              ),
                              decoration: const InputDecoration(
                                enabled: true,
                                labelText: "KM driven before last Maintenance",
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(0, 121, 140, 1),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 121, 140, 1),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(0, 121, 140, 1),
                                  ),
                                ),
                                hintText:
                                    "Enter kilometers driven before the last maintenance.",
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(0, 121, 140, 1),
                                ),
                              ),
                              onChanged: (value) {
                                kmdrivensincelastmaintenance = value;
                              },
                              // controller: kmDriven,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              // height: MediaQuery.of(context).size.height * 0.08,
                              // width: MediaQuery.of(context).size.width * 0.515,
                              height: 50,
                              width: 100,
                              color: const Color.fromRGBO(0, 121, 140, 1),
                              child: TextButton(
                                onPressed: () {
                                  print(vinnumber);
                                  print(kmdriven);
                                  print(kmdrivensincelastmaintenance);
                                  carProfileData = CarProfileData(
                                      vinNumber: vinnumber,
                                      carDriven: kmdriven,
                                      carDrivenAtLastMaintenance:
                                          kmdrivensincelastmaintenance);
                                  print(carProfileData.vinNumber);
                                  print(carProfileData.carDriven);
                                  print(carProfileData
                                      .carDrivenAtLastMaintenance);
                                  CarProfileDataFB carProfileDataFB =
                                      CarProfileDataFB();
                                  carProfileDataFB.write(carProfileData);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PageBody(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
