class ActivityRecommendationModel {
  String? recommendation;
  int? importance;
  bool isDone = false;

  ActivityRecommendationModel();

  ActivityRecommendationModel.fromJson(Map<String, dynamic> json) {
    recommendation = json['recommendation'];
    importance = json['importance'];
  }
}
