import 'package:carrolla/models/updateRepairEventRec.dart';
import 'package:flutter/material.dart';

class UpdateRepairEvent extends StatefulWidget {
  const UpdateRepairEvent({Key key}) : super(key: key);

  @override
  _UpdateRepairEventState createState() => _UpdateRepairEventState();
}

class _UpdateRepairEventState extends State<UpdateRepairEvent> {
  final _formKey = GlobalKey<FormState>();
  var engineOilChanged;
  var breakOilChanged;
  var oilFiltersChanged;
  var airFiltersChanged;
  var sparkPlugsChanged;
  var completeMaintenance;
  var fluidsInspected;
  UpdateRepairEventRec updateRepairEventRec;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              // height: MediaQuery.of(context).size.height * 0.037,
              child: Column(
                children: [
                  const Text(
                    "Car Maintenance Update",
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
              height: MediaQuery.of(context).size.height * 0.7,
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
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 121, 140, 1),
                          ),
                          decoration: const InputDecoration(
                            enabled: true,
                            labelText: "Engine Oil Changed",
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
                                "Enter kilometers driven at time of Engine Oil change",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 121, 140, 1),
                            ),
                          ),
                          onChanged: (value) {
                            engineOilChanged = value;
                          },
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
                            labelText: "Break oil Changed",
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
                                "Enter kilometers driven at time of break oil change",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 121, 140, 1),
                            ),
                          ),
                          onChanged: (value) {
                            breakOilChanged = value;
                          },
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
                            labelText: "Oil Filters Changed",
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
                                "Enter kilometers driven at time of oil filter change",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 121, 140, 1),
                            ),
                          ),
                          onChanged: (value) {
                            oilFiltersChanged = value;
                          },
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
                            labelText: "Air filters Changed",
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
                                "Enter kilometers driven at time of air filters change",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 121, 140, 1),
                            ),
                          ),
                          onChanged: (value) {
                            airFiltersChanged = value;
                          },
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
                            labelText: "Spark Plugs Changed",
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
                                "Enter kilometers driven at time of spark plugs change",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 121, 140, 1),
                            ),
                          ),
                          onChanged: (value) {
                            sparkPlugsChanged = value;
                          },
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
                            labelText: "Periodic Maintenance",
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
                                "Enter kilometers driven at time of Periodic Maintenance",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 121, 140, 1),
                            ),
                          ),
                          onChanged: (value) {
                            completeMaintenance = value;
                          },
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
                              updateRepairEventRec = UpdateRepairEventRec(
                                engineOilChanged: engineOilChanged,
                                breakOilChanged: breakOilChanged,
                                oilFiltersChanged: oilFiltersChanged,
                                airFiltersChanged: airFiltersChanged,
                                sparkPlugsChanged: sparkPlugsChanged,
                                completeMaintenance: completeMaintenance,
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
    );
  }
}
