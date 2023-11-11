import 'dart:convert';

TempSensorEntity tempSensorEntityFromJson(String str) => TempSensorEntity.fromJson(json.decode(str));

String tempSensorEntityToJson(TempSensorEntity data) => json.encode(data.toJson());

class TempSensorEntity {
    final UserData userData;

    TempSensorEntity({
        required this.userData,
    });

    TempSensorEntity copyWith({
        UserData? userData,
    }) => 
        TempSensorEntity(
            userData: userData ?? this.userData,
        );

    factory TempSensorEntity.fromJson(Map<dynamic, dynamic> json) => TempSensorEntity(
        userData: UserData.fromJson(json["UserData"]),
    );

    Map<String, dynamic> toJson() => {
        "UserData": userData.toJson(),
    };
}

class UserData {
    final UserUid userUid;

    UserData({
        required this.userUid,
    });

    UserData copyWith({
        UserUid? userUid,
    }) => 
        UserData(
            userUid: userUid ?? this.userUid,
        );

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userUid: UserUid.fromJson(json["UserUID"]),
    );

    Map<String, dynamic> toJson() => {
        "UserUID": userUid.toJson(),
    };
}

class UserUid {
    final Map<String, Reading> readings;

    UserUid({
        required this.readings,
    });

    UserUid copyWith({
        Map<String, Reading>? readings,
    }) => 
        UserUid(
            readings: readings ?? this.readings,
        );

    factory UserUid.fromJson(Map<String, dynamic> json) => UserUid(
        readings: Map.from(json["readings"]).map((k, v) => MapEntry<String, Reading>(k, Reading.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "readings": Map.from(readings).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Reading {
    final double temperature;

    Reading({
        required this.temperature,
    });

    Reading copyWith({
        double? temperature,
    }) => 
        Reading(
            temperature: temperature ?? this.temperature,
        );

    factory Reading.fromJson(Map<String, dynamic> json) => Reading(
        temperature: json["temperature"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "temperature": temperature,
    };
}
