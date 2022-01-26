import 'package:carrolla/models/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsFB {
  FirebaseFirestore firebaseFirestore;
  initialise() {
    firebaseFirestore = FirebaseFirestore.instance;
  }

  List products = [];
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    try {
      querySnapshot = await firebaseFirestore.collection('products').get();
      if (querySnapshot.docs.isEmpty) {
        print("Empty");
      }
      if (querySnapshot.docs.isNotEmpty) {
        print('not empty');
        for (var doc in querySnapshot.docs.toList()) {
          print(doc);
          Product p = Product(
              productID: doc.id,
              productName: doc['productName'],
              productDescription: doc['productDescription'],
              price: doc['price'],
              img: doc['img']);
          print("p= $p");
          products.add(p);
        }
        print(products);
        return products;
      }
    } catch (e) {
      print(e);
    }
  }
}
