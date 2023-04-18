import 'dart:convert';

class CycleModelOld {
  final String profileId;
  final String cycleStartDate;
  final int cycleLength;
  final int periodLength;

  CycleModelOld(
      {required this.profileId,
      required this.cycleStartDate,
      required this.cycleLength,
      required this.periodLength});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'profileId': profileId});
    result.addAll({'cycleStartDate': cycleStartDate});
    result.addAll({'cycleLength': cycleLength});
    result.addAll({'periodLength': periodLength});

    return result;
  }

  factory CycleModelOld.fromMap(Map<String, dynamic> map) {
    return CycleModelOld(
      profileId: map['profileId'] ?? '',
      cycleStartDate: map['cycleStartDate'] ?? '',
      cycleLength: map['cycleLength']?.toInt() ?? 0,
      periodLength: map['periodLength']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CycleModelOld.fromJson(String source) =>
      CycleModelOld.fromMap(json.decode(source));
}
