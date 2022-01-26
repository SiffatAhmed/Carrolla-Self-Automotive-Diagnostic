import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carrolla/models/carProfileData.dart';

class CarProfileDataFB {
  // FirebaseFirestore firebaseFirestore;
  // initialise() {
  //   firebaseFirestore = FirebaseFirestore.instance;
  // }
  List cpds = [];
  Future<CarProfileData> read() async {
    QuerySnapshot querySnapshot;
    try {
      querySnapshot =
          await FirebaseFirestore.instance.collection('carProfile').get();
      if (querySnapshot.docs.isEmpty) {
        print("Empty");
      }
      if (querySnapshot.docs.isNotEmpty) {
        print('not empty');
        for (var doc in querySnapshot.docs.toList()) {
          print(doc);
          CarProfileData cpd = CarProfileData(
            vinNumber: doc['vinNumber'],
            carDriven: doc['carDriven'],
            carDrivenAtLastMaintenance: doc['carDrivenAtLastMaintenance'],
          );
          // Product p = Product(
          //     productID: doc.id,
          //     productName: doc['productName'],
          //     productDescription: doc['productDescription'],
          //     price: doc['price'],
          //     img: doc['img']);
          // print("p= $p");
          cpds.add(cpd);
        }
        // print(cpd);
        return cpds[0];
      }
    } catch (e) {
      print(e);
    }
  }

  void write(CarProfileData cpd) {
    try {
      FirebaseFirestore.instance.collection('carProfile').add({
        'vinNumber': cpd.vinNumber,
        'carDriven': cpd.carDriven,
        'carDrivenAtLastMaintenance': cpd.carDrivenAtLastMaintenance
      }).then((_) {
        print('Success');
      });
    } catch (e) {
      print(e);
    }
  }
}
