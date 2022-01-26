import 'package:flutter/material.dart';
import 'package:carrolla/Views/marketplace/checkoutPage.dart';
import 'package:carrolla/Views/marketplace/productsView.dart';

void main() {
  runApp(MarketPlace());
}

class MarketPlace extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MarketPlaceHomePage(),
    );
  }
}

class MarketPlaceHomePage extends StatefulWidget {
  const MarketPlaceHomePage({Key key}) : super(key: key);

  @override
  _MarketPlaceHomePageState createState() => _MarketPlaceHomePageState();
}

class _MarketPlaceHomePageState extends State<MarketPlaceHomePage> {
  int _selectedIndex = 0;
  Widget bodySelectedPage = ProductsView();
  String _title = "Products";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          {
            _title = "Products";
            bodySelectedPage = ProductsView();
          }
          break;
        case 1:
          {
            _title = "CheckOut";
            bodySelectedPage = CheckOut();
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(4, 47, 60, 1),
          title: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              Text(_title)
            ],
          ),
        ),
        body: bodySelectedPage,
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          backgroundColor: Color.fromRGBO(4, 47, 60, 1),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.shop),
              icon: Icon(Icons.shop_outlined),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.payment),
              icon: Icon(Icons.payment_outlined),
              label: "Checkout",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          onTap: _onItemTapped,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
