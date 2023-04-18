// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:project_cycles/features/biometric_information/biometric_information_model.dart';
// import 'package:project_cycles/features/biometric_information/biometric_information_repository.dart';

// class BiometricInformationController extends GetxController {
//   final BiometricInformationRepository _biometricInformationRepository = BiometricInformationRepository();

//   BiometricInformationController();

//   Future<void> callBiometricInformation({
//     required activityTime,
//     required deepsLeep,
//     required hrv,
//     required heartBeat,
//     required remsLeep,
//     required respiratoryRate,
//     required restTime,
//     required temperature,
//   }) async {

//     const id = "689049e0-510e-45b4-ada4-23cbc8a74d15";

//     final biometricInformationModel = BiometricInformationModel(
//       profileId: id,
//       activityTime: activityTime,
//       deepsLeep: deepsLeep,
//       hrv: hrv,
//       heartBeat: heartBeat,
//       remsLeep: remsLeep,
//       respiratoryRate: respiratoryRate,
//       restTime: restTime,
//       temperature: temperature,
//     );

//     try {
//       // await _biometricInformationRepository
//       //     .postBiometricInformation(biometricInformationModel);

//     } catch (e) {
//       log('BiometricInformationController error: $e');
//     }
//   }
// }
