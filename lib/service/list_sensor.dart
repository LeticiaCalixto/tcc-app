import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/sensor.dart';

Future<List<SensorEntity>> fetchSensors({
  required String emailResponsible,
}) async {
  List<SensorEntity> temp = [];

  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('sensors').get();

  for (var sensor in querySnapshot.docs) {
    Map<String, dynamic> sensorData = sensor.data();

    if (sensorData['responsible'] == emailResponsible) {
      temp.add(SensorEntity.fromMap(sensorData));
    }
  }

  return temp;
}