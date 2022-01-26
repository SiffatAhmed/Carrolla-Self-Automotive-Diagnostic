import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carrolla/Models/bill.dart';
import 'package:carrolla/Views/marketplace/checkoutPage.dart';
import 'package:carrolla/Views/marketplace/productsView.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PayBill extends StatefulWidget {
  PayBill({
    Key key,
  }) : super(key: key);

  @override
  _PayBillState createState() => _PayBillState();
}

class _PayBillState extends State<PayBill> {
  Bill _bill = new Bill(totalBill: price, cartItems: cartProds);
  int _index = 0;

  void navBarItemTapped(index) {
    setState(() {
      _index = index;
      index == 0
          ? Clipboard.setData(
              ClipboardData(text: _bill.totalBill.round().toString()))
          : Clipboard.setData(ClipboardData(text: _bill.orderNumber));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(4, 47, 60, 1),
        title: Text("Pay bill via Bykea"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromRGBO(4, 47, 60, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.copy_outlined),
            label: "Copy Total Bill",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.copy_outlined),
            label: "Copy Order Number",
          ),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.amber,
        onTap: navBarItemTapped,
      ),
      url: 'https://bykea.cash/carrolla',
      clearCache: true,
      clearCookies: true,
    );
  }
}
