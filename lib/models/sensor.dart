class SensorEntity {
  final int sensorId;
  final String sensorName;
  final int temperature;

  const SensorEntity({
    required this.sensorId,
    required this.sensorName,
    required this.temperature,
  });

  factory SensorEntity.fromJson(Map<String, dynamic> json) {
    return SensorEntity(
      sensorId: json['userId'],
      sensorName: json['sensorName'],
      temperature: json['temperature'],
    );
  }
}