import 'package:carrolla/views/HelpPage/HelpPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TosMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(54, 117, 136, 1),
        title: Text('Terms of Service'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Terms of Service\n",
              softWrap: true,
              textAlign: TextAlign.start,
              style: GoogleFonts.openSans(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Last updated: (September 21, 2021)",
              textAlign: TextAlign.start,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "Please read these Terms of Service (\"Terms\", \"Terms of Service\") carefully before using the Car Rolla: Automotive Diagnostic Application is a mobile application operated Car Rolla: Automotive Diagnostic Application Pvt. Ltd. \n Your access to and use of the Service is conditioned on your acceptance of and compliance with these Terms. These Terms apply to all visitors, users and others who access or use the Service.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "By accessing or using the Service you agree to be bound by these Terms. If you disagree with any part of the terms then you may not access the Service.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Termination",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                height: 2.5,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "We may terminate or suspend access to our Service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.\n\nAll provisions of the Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "Content",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                height: 2.5,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Our Service allows you to post, link, store, share and otherwise make available certain information, text, graphics, videos, or other material (\"Content\"). You are responsible for taking copyright permissions. We are using all the products, logos, videos and other content with our legal copyrights.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "Links To Other Web Sites",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                height: 2.5,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Our Service may contain links to third-party web sites or services that are not owned or controlled by Car Rolla: Automotive Diagnostic Application Pvt. Ltd. Car Rolla: Automotive Diagnostic Application Pvt. Ltd. has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third-party web sites or services. You further acknowledge and agree that Car Rolla: Automotive Diagnostic Application Pvt. Ltd.\n shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such web sites or services.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "Changes",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                height: 2.5,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will try to provide at least 30 days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "Contact us.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                height: 2.5,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpPage(),
                  ),
                );
              },
              child: Text(
                "If you have any questions about these Terms, please contact us.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
