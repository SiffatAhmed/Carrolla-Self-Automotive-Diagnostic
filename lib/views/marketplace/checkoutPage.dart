import 'package:carrolla/models/bill.dart';
import 'package:carrolla/models/firebaseInteraction/BillFB.dart';
import 'package:flutter/material.dart';
import 'package:carrolla/Views/marketplace/payBill.dart';
import 'package:carrolla/Views/marketplace/productsView.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

double price = 0;
List prodIDs = [];

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    if (price != 0) price = 0;
    for (var cartProd in cartProds) {
      price += cartProd.price;
      prodIDs.add(cartProd.productID);
    }
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5),
                height: MediaQuery.of(context).size.height * 0.06,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color.fromRGBO(54, 117, 136, 1),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Row(
                          children: [
                            Text(
                              "Your total bill is: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "PKR: ${price.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(54, 117, 136, 1),
                      child: Text(
                        "You have chosen ${cartProds.length.toString()} products",
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextButton(
                  onPressed: () {
                    BillFB c = BillFB();
                    Bill bill = Bill(totalBill: price, cartItems: prodIDs);
                    c.write(bill);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PayBill()));
                  },
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(54, 117, 136, 1),
                    elevation: 5,
                    padding: EdgeInsets.all(10),
                    animationDuration: Duration(microseconds: 5),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.73515,
          child: ListView.builder(
            itemCount: cartProds.length,
            itemBuilder: (BuildContext context, index) {
              return Column(
                children: [
                  Card(
                    shadowColor: Colors.black,
                    elevation: 2,
                    margin: EdgeInsets.symmetric(
                      vertical: 1,
                      horizontal: 0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.15,
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.001),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(cartProds[index].img),
                            maxRadius: 25,
                            minRadius: 10,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.59,
                              margin: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      cartProds[index].productName,
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      cartProds[index].productID,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete_forever),
                                    onPressed: () {
                                      cartProds.removeAt(index);
                                      setState(() {});
                                    },
                                    alignment: Alignment.centerRight,
                                    color: Colors.red,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      "PKR ${cartProds[index].price.toString()}",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
