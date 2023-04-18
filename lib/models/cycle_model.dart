import 'package:project_cycles/utils/calendar_utils.dart';

enum CyclePhases { menstrual, follicular, ovulatory, luteal }

class CycleModel {
  bool? usingHormonalContraceptive;
  DateTime? currentPeriodStartDate;
  DateTime? currentPeriodEndDate;
  String? menstrualSymptoms;
  int? cycleLength;
  int follicularPhaseLength = 6;
  int ovulationPhaseLength = 3;

  CyclePhases get cyclePhase {
    if (differenceInDays <= menstrualPhaseLength!) {
      return CyclePhases.menstrual;
    } else if (differenceInDays <=
        menstrualPhaseLength! + follicularPhaseLength) {
      return CyclePhases.follicular;
    } else if (differenceInDays <=
        menstrualPhaseLength! + follicularPhaseLength + ovulationPhaseLength) {
      return CyclePhases.ovulatory;
    } else {
      return CyclePhases.luteal;
    }
  }

  int get cyclePhaseLength {
    switch (cyclePhase) {
      case CyclePhases.menstrual:
        return menstrualPhaseLength!;
      case CyclePhases.follicular:
        return follicularPhaseLength;
      case CyclePhases.ovulatory:
        return ovulationPhaseLength;
      case CyclePhases.luteal:
        return lutealPhaseLength;
    }
  }

  String get cyclePhaseName {
    switch (cyclePhase) {
      case CyclePhases.menstrual:
        return 'Menstrual';
      case CyclePhases.follicular:
        return 'Follicular';
      case CyclePhases.ovulatory:
        return 'Ovulatory';
      case CyclePhases.luteal:
        return 'Luteal';
    }
  }

  int get lutealPhaseLength =>
      cycleLength! -
      follicularPhaseLength -
      ovulationPhaseLength -
      menstrualPhaseLength!;

  int? menstrualPhaseLength;
  DateTime? cycleStartDay;
  List symptoms = [];
  List menstrualSymptomsChoice = [];
  List flowSymptomsChoice = [];

  CycleModel();

  CycleModel.fromJson(Map<String, dynamic> json) {
    cycleStartDay = DateTime.tryParse(json['cycleStartDate']);
    cycleLength = json['cycleLength'];
    menstrualPhaseLength = json['periodLength'];
  }

  int get differenceInDaysByPhase {
    switch (cyclePhase) {
      case CyclePhases.menstrual:
        return differenceInDays;
      case CyclePhases.follicular:
        return differenceInDays - menstrualPhaseLength!;
      case CyclePhases.ovulatory:
        return differenceInDays - menstrualPhaseLength! - follicularPhaseLength;
      case CyclePhases.luteal:
        return differenceInDays -
            menstrualPhaseLength! -
            follicularPhaseLength -
            ovulationPhaseLength;
    }
  }

  int get differenceInDays {
    return CalendarUtils.differenceBetweenInDays(
        dateTime1: DateTime.now().add(const Duration(days: 1)),
        dateTime2: cycleStartDay!);
  }

  String get formattedCurrentPeriodStartDate {
    return CalendarUtils.dateTimeToString(
        dateTime: currentPeriodStartDate ?? DateTime.now());
  }

  String get formattedCurrentPeriodEndDate {
    return CalendarUtils.dateTimeToString(
        dateTime: currentPeriodEndDate ?? DateTime.now());
  }
}
