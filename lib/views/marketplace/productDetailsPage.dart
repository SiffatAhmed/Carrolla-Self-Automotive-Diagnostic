import 'package:flutter/material.dart';
import 'package:carrolla/Models/cart.dart';
import 'package:carrolla/Views/marketplace/productsView.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({
    Key key,
    @required this.product,
  }) : super(key: key);

  var product;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(4, 47, 60, 1),
          title: FittedBox(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  product.productName,
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: NetworkImage(product.img),
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4872,
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                product.productName,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: FittedBox(
                              child: Text(
                                "PKR ${product.price.toString()}",
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.shopping_cart_outlined),
                            onPressed: () {
                              Cart cartProd = new Cart(
                                productName: product.productName,
                                price: product.price,
                                productID: product.productID,
                                img: product.img,
                              );
                              cartProds.add(cartProd);
                            },
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: SingleChildScrollView(
                        child: Text(
                          product.productDescription,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
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
      ),
    );
  }
}
