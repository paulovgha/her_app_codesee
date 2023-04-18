import 'package:project_cycles/models/activity_recommendation_model.dart';
import 'package:project_cycles/models/symptom_recommendation_model.dart';

class RecommendationModel {
  String? currentCyclePhase;
  String? currentCyclePhaseStartDate;
  String? currentCyclePhaseEndDate;
  String? currentCyclePhaseStage;
  List description = [];

  List<ActivityRecommendationModel> activityRecommendations = [];

  List<ActivityRecommendationModel> get activityRecommendationsOrdered {
    activityRecommendations
        .sort((a, b) => a.importance!.compareTo(b.importance!));
    return activityRecommendations;
  }

  List<SymptomRecommendationModel> symptomRecommendations = [];
  RecommendationModel();

  RecommendationModel.fromJson(Map<String, dynamic> json) {
    currentCyclePhase = json['phase'];
    currentCyclePhaseStartDate = json['period']['startDate'];
    currentCyclePhaseEndDate = json['period']['endDate'];
    currentCyclePhaseStage = json['stage'];
    description = json['description'] ?? [];
    activityRecommendations = json['activityRecommendations']
            .map<ActivityRecommendationModel>(
                (e) => ActivityRecommendationModel.fromJson(e))
            .toList() ??
        [];
    symptomRecommendations = json['symptomsRecommendations']
            .map<SymptomRecommendationModel>(
                (e) => SymptomRecommendationModel.fromString(e))
            .toList() ??
        [];
  }
}
