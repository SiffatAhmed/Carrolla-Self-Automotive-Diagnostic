import 'package:carrolla/views/HelpPage/HelpPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(54, 117, 136, 1),
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy\n",
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
              "Car Rolla: Automotive Diagnostic Application Pvt. Ltd. Operates Car Rolla: Automotive Diagnostic Application. This page informs you of our policies regarding the collection, use and disclosure of Personal Information we receive from users of the Site.\n\n We use your Personal Information only for providing and improving the Site. By using the Site, you agree to the collection and use of information in accordance with this policy.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "Information Collection And Use",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                height: 2.5,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "While using our app, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you. Personally identifiable information may include, but is not limited to your name.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "Log Data",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                height: 2.5,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Like many app operators, we collect information that your browser sends whenever you visit our app (\"Log Data\").\n\nThis Log Data may include information such as your mobile’s Internet Protocol (\"IP\") address, Operating System type, Operating System version, the pages of our app that you use, the time and date of your visit, the time spent on those pages and other statistics. \n\nIn addition, we may use third party services such as Google Analytics that collect, monitor and analyze the usage.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "Communications",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                height: 2.5,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "We may use your Personal Information to contact you with newsletters, marketing or promotional materials and future new applications.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "Security",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                height: 2.5,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "The security of your Personal Information is important to us, but remember that no method of transmission over the Internet, or method of electronic storage, is 100% secure. While we strive to use commercially acceptable means to protect your Personal Information, we cannot guarantee its absolute security.",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "Changes To This Privacy Policy",
              textAlign: TextAlign.justify,
              style: GoogleFonts.openSans(
                height: 2.5,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "This Privacy Policy is effective as of (September 21, 2021) and will remain in effect except with respect to any changes in its provisions in the future, which will be in effect immediately after being posted on this page.\n\nWe reserve the right to update or change our Privacy Policy at any time and you should check this Privacy Policy periodically. Your continued use of the Service after we post any modifications to the Privacy Policy on this page will constitute your acknowledgment of the modifications and your consent to abide and be bound by the modified Privacy Policy.\n\nIf we make any material changes to this Privacy Policy, we will notify you either through the email address you have provided us, or by placing a prominent notice on our website.",
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
