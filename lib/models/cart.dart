import 'package:flutter/cupertino.dart';

class Cart {
  String productName;
  var price;
  String img;
  var productID;
  Cart(
      {@required this.productName,
      @required this.price,
      @required this.productID,
      @required this.img});
}
