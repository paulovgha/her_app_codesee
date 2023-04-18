import 'dart:convert';

class ActivitiesModel {
  final String profileId;
  final String activeName;
  final String activeDescription;
  final List<String> checklist;

  ActivitiesModel(
      {required this.profileId,
      required this.activeName,
      required this.activeDescription,
      required this.checklist});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'profileId': profileId});
    result.addAll({'activeName': activeName});
    result.addAll({'activeDescription': activeDescription});
    result.addAll({'checklist': checklist});

    return result;
  }

  factory ActivitiesModel.fromMap(Map<String, dynamic> map) {
    return ActivitiesModel(
      profileId: map['profileId'] ?? '',
      activeName: map['activeName'] ?? '',
      activeDescription: map['activeDescription'] ?? '',
      checklist: List<String>.from(map['checklist']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivitiesModel.fromJson(String source) =>
      ActivitiesModel.fromMap(json.decode(source));
}
