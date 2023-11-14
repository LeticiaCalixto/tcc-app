class SensorEntity {
  final String? name;
  final double? temperature;
  final int? tempMax;
  final int? tempMin;
  final String? description;
  final String? responsible;

  const SensorEntity({
    required this.name,
    required this.temperature,
    required this.tempMax,
    required this.tempMin,
    required this.description,
    required this.responsible,
  });

  factory SensorEntity.fromJson(Map<String, dynamic> json) {
    return SensorEntity(
      name: json['name'],
      temperature: json['temperature'],
      tempMax: json['tempMax'],
      tempMin: json['tempMin'],
      description: json['description'],
      responsible: json['responsible'],
    );
  }

  factory SensorEntity.fromMap(Map<String, dynamic> map) {
    return SensorEntity(
      name: map['name'],
      temperature: map['temperature'] as double?,
      tempMax: map['tempMax'] as int?,
      tempMin: map['tempMin'] as int?,
      description: map['description'],
      responsible: map['responsible'],
    );
  }
}
