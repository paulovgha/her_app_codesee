class SymptomRecommendationModel {
  String? symptom;
  bool isDone = false;

  SymptomRecommendationModel.fromJson(Map<String, dynamic> json) {
    symptom = json['symptom'];
  }
  SymptomRecommendationModel.fromString(String data) {
    symptom = data;
  }
}

// TODO: review variable names
