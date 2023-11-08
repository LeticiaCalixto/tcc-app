import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/sensor.dart';

Future<List<SensorEntity>> fetchSensors() async {
  List<SensorEntity> temp = [];

  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('sensors').get();

  for (var sensor in querySnapshot.docs) {
    temp.add(SensorEntity.fromMap(sensor.data()));
  }

  return temp;
}