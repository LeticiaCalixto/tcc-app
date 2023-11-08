class SensorEntity {
  final String sensorName;
  final int temperature;
  final int tempMax;
  final int tempMin;
  final String description;

  const SensorEntity({
    required this.sensorName,
    required this.temperature,
    required this.tempMax,
    required this.tempMin,
    required this.description,
  });

  factory SensorEntity.fromJson(Map<String, dynamic> json) {
    return SensorEntity(
      sensorName: json['sensorName'],
      temperature: json['temperature'],
      tempMax: json['tempMax'],
      tempMin: json['tempMin'],
      description: json['description'],
    );
  }

  //from map
  factory SensorEntity.fromMap(Map<String, dynamic> map) {
    return SensorEntity(
      sensorName: map['sensorName'],
      temperature: map['temperature'],
      tempMax: map['tempMax'],
      tempMin: map['tempMin'],
      description: map['description'],
    );
  }
}