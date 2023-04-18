import 'dart:developer';

import 'package:get/get.dart';

import 'package:project_cycles/core/keys/config_keys.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_model.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_repository.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';
import 'package:project_cycles/utils/calendar_utils.dart';

class SymptomsController extends GetxController {
  RxList<String> allSymptoms = <String>[].obs;
  RxList<String> menstrualSymptoms = <String>[].obs;
  RxList<String> flowSymptoms = <String>[].obs;
  RxList<String> sleepQuality = <String>[].obs;
  RxList<String> mood = <String>[].obs;
  RxList<String> loveAndSex = <String>[].obs;
  RxList<String> nutrition = <String>[].obs;

  addToAllSymptoms() {
    allSymptoms.addAll(menstrualSymptoms);
    allSymptoms.addAll(flowSymptoms);
    allSymptoms.addAll(sleepQuality);
    allSymptoms.addAll(mood);
    allSymptoms.addAll(loveAndSex);
    allSymptoms.addAll(nutrition);
  }

  final SymptomsRepository _symptomsRepository = SymptomsRepository();
  final UserController _userController = Get.find();

  Future<void> callSymptoms() async {
    try {
      final id = await _symptomsRepository.secureStorageService
          .readOne(key: ConfigKeys.id);

      _userController.userModel.cycleModel.symptoms
          .add(_userController.userModel.cycleModel.flowSymptomsChoice);

      _userController.userModel.cycleModel.symptoms
          .add(_userController.userModel.cycleModel.menstrualSymptomsChoice);

      final symptomsModel = SymptomsModel(
          profileId: id!,
          date: CalendarUtils.dateTimeToString(dateTime: DateTime.now()),
          symptoms:
              _userController.userModel.cycleModel.symptoms as List<String>);

      await _symptomsRepository.postSymptoms(symptomsModel);
    } catch (e) {
      log(e.toString());
    }
  }
}
