class OnboardingModel {
  OnboardingModel._();
  static final OnboardingModel instance = OnboardingModel._();

  DateTime? birthDate;
  bool? usingHormonalContraceptive;
  DateTime? currentPeriodStartDate;
  DateTime? currentPeriodEndDate;
  int? cycleLength;
  String? menstrualSymptoms;
}
