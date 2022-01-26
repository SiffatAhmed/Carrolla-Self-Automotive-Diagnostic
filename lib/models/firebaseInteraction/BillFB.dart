import 'package:carrolla/models/bill.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillFB {
  // FirebaseFirestore firebaseFirestore;
  // initialise() {
  //   firebaseFirestore = FirebaseFirestore.instance;
  // }

  void write(Bill bill) {
    try {
      FirebaseFirestore.instance.collection('orders').add({
        'totalbill': bill.totalBill,
        'ordernumber': bill.orderNumber,
        'caritems': bill.cartItems
      }).then((_) {
        print('Success');
      });
    } catch (e) {
      print(e);
    }
  }
}
