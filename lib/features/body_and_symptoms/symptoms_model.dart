import 'dart:convert';

class SymptomsModel {
  final String profileId;
  final String date;
  final List<String> symptoms;

  SymptomsModel(
      {required this.profileId, required this.date, required this.symptoms});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'profileId': profileId,
      'date': date,
      'symptoms': symptoms,
    };
    return map;
  }

  String toJson() => json.encode(toMap());

  factory SymptomsModel.fromMap(Map<String, dynamic> map) {
    return SymptomsModel(
      profileId: map['profileId'] ?? '',
      date: map['date'] ?? '',
      symptoms: List<String>.from((map['symptoms'] ?? <String>[])),
    );
  }

  factory SymptomsModel.fromJson(String source) =>
      SymptomsModel.fromMap(json.decode(source));
}
