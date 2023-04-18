import 'package:project_cycles/features/body_and_symptoms/symptoms_model.dart';

abstract class SymptomsServices {
  Future<void> getSymptoms(SymptomsModel symptomsModel);
  Future<void> getByIdSymptoms(SymptomsModel symptomsModel);
  Future<void> postSymptoms(SymptomsModel symptomsModel);
  Future<void> editSymptoms(SymptomsModel symptomsModel);
  Future<void> deleteSymptoms(SymptomsModel symptomsModel);
}
