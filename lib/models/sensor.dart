class SensorEntity {
  final String name;
  final int temperature;
  final int tempMax;
  final int tempMin;
  final String description;

  const SensorEntity({
    required this.name,
    required this.temperature,
    required this.tempMax,
    required this.tempMin,
    required this.description,
  });

  factory SensorEntity.fromJson(Map<String, dynamic> json) {
    return SensorEntity(
      name: json['name'],
      temperature: json['temperature'],
      tempMax: json['tempMax'],
      tempMin: json['tempMin'],
      description: json['description'],
    );
  }

  factory SensorEntity.fromMap(Map<String, dynamic> map) {
    return SensorEntity(
      name: map['name'],
      temperature: map['temperature'] as int,
      tempMax: map['tempMax'] as int,
      tempMin: map['tempMin'] as int,
      description: map['description'],
    );
  }
}
