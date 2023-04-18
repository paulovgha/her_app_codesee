import 'package:project_cycles/models/cycle_model.dart';
import 'package:project_cycles/models/recommendation_model.dart';

class UserModel {
  UserModel();

  String? id;
  String? cookie;
  String? firstName;
  String? lastName;
  String? country;
  String? city;
  String? email;
  String? phone;
  String? password;
  DateTime? birthDate;
  CycleModel cycleModel = CycleModel();
  RecommendationModel recommendationModel = RecommendationModel();

  UserModel.fromInstanceJson(Map<String, dynamic> json) {
    id = json['id'];
    cookie = json['cookie'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    country = json['country'];
    city = json['city'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    if (json.containsKey('birthDate')) {
      birthDate = DateTime.tryParse(json['birthDate']);
    }
  }

  int get daysSinceCycleStartDate {
    int date = DateTime.now()
        .difference(cycleModel.cycleStartDay ?? DateTime.now())
        .inDays;
    return date;
  }

  int get currentCycleLength {
    int date = cycleModel.cycleLength ?? 1;
    return date;
  }
}
