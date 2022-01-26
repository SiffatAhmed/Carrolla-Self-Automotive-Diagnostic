import 'package:carrolla/models/workshop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkshopFB {
  FirebaseFirestore firebaseFirestore;
  initialise() {
    firebaseFirestore = FirebaseFirestore.instance;
  }

  List workshops = [];
// factory Question.fromJson(Map<String, dynamic> json) => Question(
//     id: json["id"],
//     question: json["question"],
//     customAnswer: json["customAnswer"],
// );
// factory WorkshopFB.fromJson(Map<String, dynamic> json) => Workshop(workshopID: json['id'], name: json['name'], address: json['address'], longitude: json['longitude'], latitude: json['latitude'])

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    try {
      querySnapshot = await firebaseFirestore.collection('workshop').get();
      if (querySnapshot.docs.isEmpty) {
        print("Empty");
      }
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          print(doc);
          Map m = {
            'id': doc.id,
            'name': doc['name'],
            'address': doc['address'],
            'latlong': doc['latlong'],
            // 'latitude': doc['latitude']
          };
          Workshop w = new Workshop(
              workshopID: doc.id,
              name: m['id'],
              address: m['name'],
              latlong: m['latlong']

              // longitude: m['longitude'],
              // latitude: m['latitude'],
              );
          print(w.latlong);
          // print("w= $w ");
          workshops.add(w);
        }
        print(workshops);
        return workshops;
      }
    } catch (e) {
      print(e);
    }
  }
}
