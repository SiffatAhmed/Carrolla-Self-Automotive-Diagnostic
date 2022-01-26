import 'dart:convert';

import 'package:carrolla/views/HelpPage/HelpPage.dart';
import 'package:carrolla/views/mainpages/mappage.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carrolla/models/Items.dart';
import 'package:intl/intl.dart';

/*
*IMPORTANT INFORMATION IS HIGHLIGHTED
HomePage design on how Items class data will be displayed.

*/
List errorCodes;
double distanceSinceDTCcodesCleared;

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  void readDataFromJson() async {
    final String response = await DefaultAssetBundle.of(context)
        .loadString("assets/OtherFiles/code.json");
    final data = await json.decode(response);
    setState(() {
      distanceSinceDTCcodesCleared = data['Distance'][0];
      errorCodes = data["Error_Codes"][0];
      print(distanceSinceDTCcodesCleared);
      item1 = Items(
        title: "Distance Driven Since DTC Cleared",
        // subtitle: "errorCodes.toString()",
        subtitle: "$distanceSinceDTCcodesCleared km",
        // subtitle: 'hello',
        //event: "3 Events",
        //img: "assets/calendar.png"
        img: "assets/Images/distance.png",
      );
      var date = DateFormat.yMMMMEEEEd()
          .format(new DateTime.now().add(new Duration(days: 180)));
      item2 = Items(
        title: "Time Till Next Maintenance",
        subtitle: "$date",
        //event: "4 Items",
        //img: "assets/food.png",
        img: "assets/Images/sand-clock.png",
      );
      var length = errorCodes.length;
      item3 = Items(
        title: "Maintenance list",
        subtitle: "$length maintenance tasks due",
        //event: "",
        img: "assets/Images/repair.png",
      );
    });
  }

  Items item1 = Items(
    title: "Distance Driven Today",
    // subtitle: "errorCodes.toString()",
    subtitle: distanceSinceDTCcodesCleared.toString(),
    // subtitle: 'hello',
    //event: "3 Events",
    //img: "assets/calendar.png"
    img: "assets/Images/distance.png",
  );
  Items item2 = Items(
    title: "Time Till Next Maintenance",
    subtitle: "Expected time is 12th July",
    //event: "4 Items",
    //img: "assets/food.png",
    img: "assets/Images/sand-clock.png",
  );

  Items item3 = Items(
    title: "Maintenance list.",
    subtitle: "2 maintenance tasks due",
    //event: "",
    img: "assets/Images/repair.png",
  );

  Items item4 = Items(
    title: "Find Wokshops.",
    subtitle: "Here you can find workshops",
    //event: "",
    img: "assets/Images/car-with-wrench.png",
  );

  Items item5 = Items(
    title: "Forgery Status",
    subtitle: "Not forged",
    //event: "4 Items",
    img: "assets/Images/cross.png",
  );

  Items item6 = Items(
    title: "Help",
    subtitle: "Stuck with the app? Get help now",
    //event: "2 Items",
    img: "assets/Images/question.png",
  );

  @override
  void initState() {
    // print(distanceSinceDTCcodesCleared);
    super.initState();
    readDataFromJson();
  }

  @override
  Widget build(BuildContext context) {
    List<Items> listforBoxes = [item4, item6];
    List<Items> listforList = [item1, item2, item3, item5];

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.305,
          child: ListView.builder(
            itemCount: listforList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Color.fromRGBO(54, 117, 136, 1),
                elevation: 1,
                margin: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 0.1,
                ),
                child: ListTile(
                  leading: Text(
                    listforList[index].title,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    listforList[index].subtitle,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.49435,
          child: GridView.count(
              childAspectRatio: 1.0,
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              children: listforBoxes.map((data) {
                return GestureDetector(
                  onTap: () {
                    data.title == "Find Wokshops."
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapsPage(),
                            ),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HelpPage(),
                            ),
                          );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(54, 117, 136, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          data.img,
                          color: Colors.white70,
                          width: MediaQuery.of(context).size.width * 0.05,
                          height: 30,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          data.subtitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()),
        ),
      ],
    );
  }
}
