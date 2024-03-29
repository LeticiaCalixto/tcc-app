class SensorEntity {
  final String? name;
  final double? temperature;
  final double? tempMax;
  final double? tempMin;
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
    temperature: map['temperature']?.toDouble(), 
    tempMax: map['tempMax']?.toDouble(),      
    tempMin: map['tempMin']?.toDouble(),     
    description: map['description'],
    responsible: map['responsible'],
  );
}
}
