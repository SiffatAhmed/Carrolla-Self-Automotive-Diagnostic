import 'package:carrolla/models/LogData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogDataFB {
  List lds = [];
  Future<LogData> read() async {
    QuerySnapshot querySnapshot;
    try {
      querySnapshot =
          await FirebaseFirestore.instance.collection('LogData').get();
      if (querySnapshot.docs.isEmpty) {
        print("Empty");
      }
      if (querySnapshot.docs.isNotEmpty) {
        print('not empty');
        for (var doc in querySnapshot.docs.toList()) {
          print(doc);
          LogData ld = LogData(
            vinNumber: doc['vinNumber'],
            totalDistanceDriven: doc['totalDistanceDriven'],
            distanceSinceLastMaintenance: doc['distanceSinceLastMaintenance'],
            engineOilChangeKM: doc['engineOilChangeKM'],
            engineOilChangeDate: doc['engineOilChangeDate'],
            wheelAlignmentKM: ['wheelAlignmentKM'],
            timeSinceDTCcodesCleared: ['timeSinceDTCcodesCleared'],
          );
          lds.add(ld);
        }
        // print(cpd);
        return lds[0];
      }
    } catch (e) {
      print(e);
    }
  }

  void write(LogData logData) {
    try {
      FirebaseFirestore.instance.collection('LogData').add({
        'vinNumber': logData.vinNumber,
        'totalDistanceDriven': logData.totalDistanceDriven,
        'distanceSinceLastMaintenance': logData.distanceSinceLastMaintenance,
        'engineOilChangeKM': logData.engineOilChangeKM,
        'engineOilChangeDate': logData.engineOilChangeDate,
        'wheelAlignmentKM': logData.wheelAlignmentKM,
        'timeSinceDTCcodesCleared': logData.timeSinceDTCcodesCleared,
      }).then((_) {
        print('Success');
      });
    } catch (e) {
      print(e);
    }
  }
}
