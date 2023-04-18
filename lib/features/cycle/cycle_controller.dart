import 'dart:developer';
import 'package:project_cycles/core/keys/config_keys.dart';
import 'package:project_cycles/features/cycle/cycle_model.dart';
import 'package:project_cycles/features/cycle/cycle_repository.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';
import 'package:project_cycles/models/cycle_model.dart';
import 'package:project_cycles/models/recommendation_model.dart';
import 'package:project_cycles/models/user_model.dart';
import 'package:project_cycles/services/custom_exception.dart';
import 'package:project_cycles/services/custom_response.dart';
import 'package:project_cycles/utils/calendar_utils.dart';
import 'package:get/get.dart';

class CycleController extends GetxController {
  Rx<CustomResponse<UserModel>> cycleResponse =
      CustomResponse<UserModel>.none().obs;
  Rx<CustomResponse<UserModel>> recommendationResponse =
      CustomResponse<UserModel>.none().obs;
  final CycleRepository _cycleRepository = CycleRepository();
  final UserController _userController = Get.find();
  RxInt cycleDay = 0.obs;

  DateTime initialPhaseDate(CyclePhases cyclePhase) {
    switch (cyclePhase) {
      case CyclePhases.menstrual:
        return _userController.userModel.cycleModel.cycleStartDay!;
      case CyclePhases.follicular:
        return _userController.userModel.cycleModel.cycleStartDay!.add(Duration(
            days: _userController.userModel.cycleModel.menstrualPhaseLength!));
      case CyclePhases.ovulatory:
        return _userController.userModel.cycleModel.cycleStartDay!.add(Duration(
            days: _userController.userModel.cycleModel.menstrualPhaseLength! +
                _userController.userModel.cycleModel.follicularPhaseLength));
      case CyclePhases.luteal:
        return _userController.userModel.cycleModel.cycleStartDay!.add(Duration(
            days: _userController.userModel.cycleModel.menstrualPhaseLength! +
                _userController.userModel.cycleModel.follicularPhaseLength +
                _userController.userModel.cycleModel.ovulationPhaseLength));
    }
  }

  DateTime lastPhaseDate(CyclePhases cyclePhases) {
    switch (cyclePhases) {
      case CyclePhases.menstrual:
        return initialPhaseDate(cyclePhases).add(Duration(
            days: _userController.userModel.cycleModel.menstrualPhaseLength!));
      case CyclePhases.follicular:
        return initialPhaseDate(cyclePhases).add(Duration(
            days: _userController.userModel.cycleModel.follicularPhaseLength));
      case CyclePhases.ovulatory:
        return initialPhaseDate(cyclePhases).add(Duration(
            days: _userController.userModel.cycleModel.ovulationPhaseLength));
      case CyclePhases.luteal:
        return initialPhaseDate(cyclePhases).add(Duration(
            days: _userController.userModel.cycleModel.lutealPhaseLength));
    }
  }

  Future<void> callCycle() async {
    try {
      final id = await _cycleRepository.secureStorageService
          .readOne(key: ConfigKeys.id);
      final date = CalendarUtils.dateTimeYearToString(
          dateTime:
              _userController.userModel.cycleModel.currentPeriodStartDate!);

      final cycleModel = CycleModelOld(
        profileId: id.toString(),
        cycleStartDate: date,
        cycleLength: _userController.userModel.cycleModel.cycleLength!,
        periodLength:
            _userController.userModel.cycleModel.menstrualPhaseLength!,
      );

      final apiResponse = await _cycleRepository.postCycle(cycleModel);

      final idCycle = apiResponse['body']['result']['id'];

      log('idCycle: $idCycle');
    } catch (e) {
      log('CycleController error: $e');
    }
  }

  Future getUserCycle() async {
    try {
      cycleResponse.value = CustomResponse.loading();
      var result =
          await _cycleRepository.getCycle(_userController.userModel.id!);
      CycleModel menstrualModel = CycleModel.fromJson(result);
      _userController.userModel.cycleModel = menstrualModel;
      cycleResponse.value =
          CustomResponse.completed(data: _userController.userModel);
    } on CustomException catch (e) {
      cycleResponse.value = CustomResponse.error(error: e);
    } catch (e) {
      cycleResponse.value = CustomResponse.error(
          error: CustomException(errorMessage: e.toString()));
    }
  }

  Future getUserRecommendation() async {
    try {
      recommendationResponse.value = CustomResponse.loading();
      var result = await _cycleRepository
          .getRecommendation(_userController.userModel.id!);
      RecommendationModel recommendationModel =
          RecommendationModel.fromJson(result);
      _userController.userModel.recommendationModel = recommendationModel;
      recommendationResponse.value =
          CustomResponse.completed(data: _userController.userModel);
    } on CustomException catch (e) {
      recommendationResponse.value = CustomResponse.error(error: e);
    } catch (e) {
      recommendationResponse.value = CustomResponse.error(
          error: CustomException(errorMessage: e.toString()));
    }
  }
}
