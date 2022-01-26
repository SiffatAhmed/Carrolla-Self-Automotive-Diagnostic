import 'package:carrolla/models/firebaseInteraction/productsFB.dart';
import 'package:flutter/material.dart';
import 'package:carrolla/Models/cart.dart';
import 'package:carrolla/Views/marketplace/productDetailsPage.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key key}) : super(key: key);

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

List products = [];
// List<Product> products = [
//   product1,
//   product2,
//   product3,
// ];
List<Cart> cartProds = [];

class _ProductsViewState extends State<ProductsView> {
  ProductsFB productsFB;
  List products = [];
  initialise() {
    productsFB = ProductsFB();
    productsFB.initialise();
    productsFB.read().then((value) => {
          setState(() {
            products = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shadowColor: Colors.black,
            elevation: 2,
            margin: EdgeInsets.symmetric(
              vertical: 1,
              horizontal: 0,
            ),
            child: InkWell(
              splashColor: Colors.lightBlueAccent.shade700,
              onTap: () {
                var product = products[index];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(product: product),
                  ),
                );
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.15,
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.001),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          products[index].img,
                        ),
                        maxRadius: 25,
                        minRadius: 10,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.59,
                        margin: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].productName,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Container(
                              child: Text(
                                products[index].productDescription.length <= 135
                                    ? products[index].productDescription
                                    : products[index]
                                        .productDescription
                                        .substring(0, 135),
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
                          children: [
                            IconButton(
                              icon: Icon(Icons.shopping_cart_outlined),
                              onPressed: () {
                                var currentProduct = products[index];
                                Cart cartProd = new Cart(
                                  productName: currentProduct.productName,
                                  price: currentProduct.price,
                                  productID: currentProduct.productID,
                                  img: currentProduct.img,
                                );
                                cartProds.add(cartProd);
                              },
                              alignment: Alignment.centerRight,
                              color: Colors.red,
                            ),
                            FittedBox(
                              child: Text(
                                "PKR ${products[index].price.toString()}",
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
          );
        },
      ),
    );
  }
}
