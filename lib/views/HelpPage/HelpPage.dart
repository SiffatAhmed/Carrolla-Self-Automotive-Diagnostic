import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(54, 117, 136, 1),
          title: Text('Help ?'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / (2 / 3),
            width: MediaQuery.of(context).size.width / (1 / 3),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    "assets/Images/question.png",
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Color.fromRGBO(54, 117, 136, 1),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "If you need help contact us at our email and we'll get back to you real quick.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Color.fromRGBO(54, 117, 136, 1),
                  child: TextButton.icon(
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: "carrolla@gmail.com"));
                    },
                    label: Text(
                      "carrolla@gmail.com",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    icon: Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
