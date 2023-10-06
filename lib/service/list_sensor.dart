import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/sensor.dart';

Future<List<SensorEntity>> fetchSensors() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/sensors'));

  if (response.statusCode == 200) {
    // Se o servidor retornar uma resposta 200 OK,
    // então analise o JSON.
    var sensorJson = jsonDecode(response.body) as List;
    return sensorJson.map((sensor) => SensorEntity.fromJson(sensor)).toList();
  } else {
    // Se o servidor não retornar uma resposta 200 OK,
    // então lance uma exceção.
    throw Exception('Failed to load sensors');
  }
}