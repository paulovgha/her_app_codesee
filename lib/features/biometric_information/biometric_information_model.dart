import 'dart:convert';

class BiometricInformationModel {
  final String profileId;
  final int hrv;
  final int heartBeat;
  final int remsLeep;
  final int deepsLeep;
  final int restTime;
  final int activityTime;
  final int temperature;
  final int respiratoryRate;

  BiometricInformationModel(
      {required this.profileId,
      required this.hrv,
      required this.heartBeat,
      required this.remsLeep,
      required this.deepsLeep,
      required this.restTime,
      required this.activityTime,
      required this.temperature,
      required this.respiratoryRate});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'profileId': profileId});
    result.addAll({'hrv': hrv});
    result.addAll({'heartBeat': heartBeat});
    result.addAll({'remsLeep': remsLeep});
    result.addAll({'deepsLeep': deepsLeep});
    result.addAll({'restTime': restTime});
    result.addAll({'activityTime': activityTime});
    result.addAll({'temperature': temperature});
    result.addAll({'respiratoryRate': respiratoryRate});

    return result;
  }

  factory BiometricInformationModel.fromMap(Map<String, dynamic> map) {
    return BiometricInformationModel(
      profileId: map['profileId'] ?? '',
      hrv: map['hrv']?.toInt() ?? 0,
      heartBeat: map['heartBeat']?.toInt() ?? 0,
      remsLeep: map['remsLeep']?.toInt() ?? 0,
      deepsLeep: map['deepsLeep']?.toInt() ?? 0,
      restTime: map['restTime']?.toInt() ?? 0,
      activityTime: map['activityTime']?.toInt() ?? 0,
      temperature: map['temperature']?.toInt() ?? 0,
      respiratoryRate: map['respiratoryRate']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BiometricInformationModel.fromJson(String source) =>
      BiometricInformationModel.fromMap(json.decode(source));
}
