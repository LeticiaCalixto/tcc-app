// import 'package:firebase_database/firebase_database.dart';
// import '../models/temperature.dart';

// Future<TempSensorEntity?> fetchSensors({
//   required String emailResponsible,
// }) async {
//   late Future<TempSensorEntity?> temp = Future.value(null);

//   try {
//     final database = FirebaseDatabase.instance;
//     final rootRef = database.ref();

//     DatabaseReference reference = FirebaseDatabase.instance
//         .ref()
//         .child('UserData')
//         .child('UserUID')
//         .child('readings');

//     reference.onValue.listen((event) {
//       DataSnapshot dataSnapshot = event.snapshot;
//       Map<dynamic, dynamic>? aux = dataSnapshot.value as Map<dynamic, dynamic>?;

//       temp = Future.value(TempSensorEntity.fromJson(aux!));

//     });
//   } catch (e) {
//     print('e: $e');
//   }

//   return temp;
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/sensor.dart';

Stream<List<SensorEntity>> fetchSensors({
  required String emailResponsible,
}) {
  return FirebaseFirestore.instance.collection('sensors').snapshots().map(
      (snapshot) => _convertSnapshotToSensorList(snapshot, emailResponsible));
}

List<SensorEntity> _convertSnapshotToSensorList(
  QuerySnapshot<Map<String, dynamic>> snapshot,
  String emailResponsible,
) {
  List<SensorEntity> sensors = [];

  for (var sensor in snapshot.docs) {
    Map<String, dynamic> sensorData = sensor.data();

    // if (sensorData['responsible'] == emailResponsible) {
    //   sensors.add(SensorEntity.fromMap(sensorData));
    // }
    sensors.add(SensorEntity.fromMap(sensorData));
  }

  return sensors;
}