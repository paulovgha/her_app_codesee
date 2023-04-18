// class UserModel {
//   String? userId;
//   String? creationDate;
//   String? firstName;
//   String? lastName;
//   String? birthDate;
//   String? country;
//   String? city;
//   String? phone;
//   String? email;
//   PasswordModel? password;

//   UserModel();

//   UserModel.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     creationDate = json['creationDate'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     birthDate = json['birthDate'];
//     country = json['country'];
//     city = json['city'];
//     phone = json['phone'];
//     email = json['email'];
//     password = json['password'] != null
//         ? PasswordModel.fromJson(json['password'])
//         : null;
//   }
// }

// class PasswordModel {
//   String? id;
//   String? password;
//   String? creationDate;

//   PasswordModel();

//   PasswordModel.fromJson(Map<String, dynamic> json) {
//     id = json['passwordId'];
//     password = json['password'];
//     creationDate = json['creationDate'];
//   }
// }

// class CycleModel {
//   String? id;
//   String? creationDate;
//   String? startDate;
//   String? startDatePrediction;
//   String? endDate;
//   String? endDatePrediction;
//   String? cycleLength;
//   String? cycleLengthPrediction;
//   String? periodLength;
//   String? periodLengthPrediction;
//   String? cyclePhase;

//   CycleModel();

//   CycleModel.fromJson(Map<String, dynamic> json) {
//     id = json['cycleId'];
//     creationDate = json['creationDate'];
//     startDate = json['startDate'];
//     startDatePrediction = json['startDatePrediction'];
//     endDate = json['endDate'];
//     endDatePrediction = json['endDatePrediction'];
//     cycleLength = json['cycleLength'];
//     cycleLengthPrediction = json['cycleLengthPrediction'];
//     periodLength = json['periodLength'];
//     periodLengthPrediction = json['periodLengthPrediction'];
//     cyclePhase = json['cyclePhase'];
//   }
// }

// enum CyclePhase {
//   menstrualPhase,
//   follicularPhase,
//   ovulationPhase,
//   lutealPhase,
// }

// class MenstrualPhaseModel {
//   String? id;
//   String? phaseName;
//   String? phaseDescription;
//   String? phaseStartDate;
//   String? phaseEndDate;
//   String? phaseStartDatePrediction;
//   String? phaseEndDatePrediction;
//   String? phaseLength;
//   String? phaseLengthPrediction;
//   String? phaseStage;

//   MenstrualPhaseModel();

//   MenstrualPhaseModel.fromJson(Map<String, dynamic> json) {
//     id = json['phaseId'];
//     phaseName = json['phaseName'];
//     phaseDescription = json['phaseDescription'];
//     phaseStartDate = json['phaseStartDate'];
//     phaseEndDate = json['phaseEndDate'];
//     phaseStartDatePrediction = json['phaseStartDatePrediction'];
//     phaseEndDatePrediction = json['phaseEndDatePrediction'];
//     phaseLength = json['phaseLength'];
//     phaseLengthPrediction = json['phaseLengthPrediction'];
//     phaseStage = json['phaseStage'];
//   }
// }

// class FollicularPhaseModel {
//   String? id;
//   String? phaseName;
//   String? phaseDescription;
//   String? phaseStartDate;
//   String? phaseEndDate;
//   String? phaseStartDatePrediction;
//   String? phaseEndDatePrediction;
//   String? phaseLength;
//   String? phaseLengthPrediction;
//   String? phaseStage;

//   FollicularPhaseModel();

//   FollicularPhaseModel.fromJson(Map<String, dynamic> json) {
//     id = json['phaseId'];
//     phaseName = json['phaseName'];
//     phaseDescription = json['phaseDescription'];
//     phaseStartDate = json['phaseStartDate'];
//     phaseEndDate = json['phaseEndDate'];
//     phaseStartDatePrediction = json['phaseStartDatePrediction'];
//     phaseEndDatePrediction = json['phaseEndDatePrediction'];
//     phaseLength = json['phaseLength'];
//     phaseLengthPrediction = json['phaseLengthPrediction'];
//     phaseStage = json['phaseStage'];
//   }
// }

// class OvulationPhaseModel {
//   String? id;
//   String? phaseName;
//   String? phaseDescription;
//   String? phaseStartDate;
//   String? phaseEndDate;
//   String? phaseStartDatePrediction;
//   String? phaseEndDatePrediction;
//   String? phaseLength;
//   String? phaseLengthPrediction;
//   String? phaseStage;

//   OvulationPhaseModel();

//   OvulationPhaseModel.fromJson(Map<String, dynamic> json) {
//     id = json['phaseId'];
//     phaseName = json['phaseName'];
//     phaseDescription = json['phaseDescription'];
//     phaseStartDate = json['phaseStartDate'];
//     phaseEndDate = json['phaseEndDate'];
//     phaseStartDatePrediction = json['phaseStartDatePrediction'];
//     phaseEndDatePrediction = json['phaseEndDatePrediction'];
//     phaseLength = json['phaseLength'];
//     phaseLengthPrediction = json['phaseLengthPrediction'];
//     phaseStage = json['phaseStage'];
//   }
// }

// class LutealPhaseModel {
//   String? id;
//   String? phaseName;
//   String? phaseDescription;
//   String? phaseStartDate;
//   String? phaseEndDate;
//   String? phaseStartDatePrediction;
//   String? phaseEndDatePrediction;
//   String? phaseLength;
//   String? phaseLengthPrediction;
//   String? phaseStage;

//   LutealPhaseModel();

//   LutealPhaseModel.fromJson(Map<String, dynamic> json) {
//     id = json['phaseId'];
//     phaseName = json['phaseName'];
//     phaseDescription = json['phaseDescription'];
//     phaseStartDate = json['phaseStartDate'];
//     phaseEndDate = json['phaseEndDate'];
//     phaseStartDatePrediction = json['phaseStartDatePrediction'];
//     phaseEndDatePrediction = json['phaseEndDatePrediction'];
//     phaseLength = json['phaseLength'];
//     phaseLengthPrediction = json['phaseLengthPrediction'];
//     phaseStage = json['phaseStage'];
//   }
// }

// enum PhaseStage {
//   early,
//   mid,
//   late,
// }

// class ActivityRecommendationModel {
//   String? id;
//   String? creationDate;
//   String? cyclePhase;
//   String? phaseStage;
//   String? description;
//   String? recommendation;
//   String? importance;
//   String? isDone;

//   ActivityRecommendationModel();

//   ActivityRecommendationModel.fromJson(Map<String, dynamic> json) {
//     id = json['activityId'];
//     creationDate = json['creationDate'];
//     cyclePhase = json['cyclePhase'];
//     phaseStage = json['phaseStage'];
//     description = json['description'];
//     recommendation = json['recommendation'];
//     importance = json['importance'];
//     isDone = json['isDone'];
//   }
// }

// class SymptomRecommendationModel {
//   String? id;
//   String? creationDate;
//   String? cyclePhase;
//   String? phaseStage;
//   String? description;
//   String? recommendation;
//   String? importance;
//   String? isDone;

//   SymptomRecommendationModel();

//   SymptomRecommendationModel.fromJson(Map<String, dynamic> json) {
//     id = json['symptomId'];
//     creationDate = json['creationDate'];
//     cyclePhase = json['cyclePhase'];
//     phaseStage = json['phaseStage'];
//     description = json['description'];
//     recommendation = json['recommendation'];
//     importance = json['importance'];
//     isDone = json['isDone'];
//   }
// }

// TODO: map entity relations to elaborate more reliable models in the upcoming refactoring of the API and Flutter code