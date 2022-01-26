import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class Bill {
  double totalBill;
  String orderNumber;
  List cartItems;
  var uuid;
  Bill({
    @required this.totalBill,
    @required this.cartItems,
  }) {
    uuid = Uuid();
    orderNumber = uuid.v1();
  }
}
