import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_cycles/features/cycle/cycle_model.dart';
import 'package:project_cycles/features/cycle/cycle_services.dart';
import 'package:project_cycles/services/custom_exception.dart';
import 'package:project_cycles/services/dio_connect.dart';
import 'package:get/get.dart' as getx;
import 'package:project_cycles/services/secure_storage_service.dart';

class CycleRepository extends CycleServices {
  final _secureStorageService = const SecureStorageService();
  SecureStorageService get secureStorageService => _secureStorageService;

  DioConnection dioConnection = getx.Get.find();
  Dio get dio => dioConnection.dio;

  @override
  Future<void> deleteCycle(CycleModelOld cycleModel) {
    throw UnimplementedError();
  }

  @override
  Future<void> editCycle(CycleModelOld cycleModel) {
    throw UnimplementedError();
  }

  @override
  Future<void> getByIdCycle(CycleModelOld cycleModel) {
    throw UnimplementedError();
  }

  @override
  Future getCycle(String userId) async {
    try {
      // final cookie =
      //     await _secureStorageService.readOne(key: ConfigKeys.cookie);

      final header = await dioConnection.getAuthHeader();
      Response response = await dio.get('cycle/profileId/$userId',
          options: Options(headers: header));

      return response.data['result']['Cycles'];
    } on CustomException catch (e) {
      throw CustomException(errorMessage: e.errorMessage);
    }
  }

  @override
  Future<Map> postCycle(CycleModelOld cycleModel) async {
    final header = await dioConnection.getAuthHeader();
    final bodyData = jsonEncode({
      "profileId": cycleModel.profileId,
      "cycleStartDate": cycleModel.cycleStartDate,
      "cycleLength": cycleModel.cycleLength,
      "periodLength": cycleModel.periodLength
    });
    try {
      Response response = await dio.post('cycle',
          data: bodyData, options: Options(headers: header));
      final responseData = {};
      responseData['body'] = response.data;
      log('CycleRepository: ${response.data}');
      return responseData;
    } on CustomException catch (e) {
      throw e.errorMessage!;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future getRecommendation(String userId) async {
    try {
      // final cookie =
      //     await _secureStorageService.readOne(key: ConfigKeys.cookie);
      // Map<String, String> headers = {
      //   'cookie': cookie.toString(),
      //   'Content-Type': 'application/json'
      // };
      final header = await dioConnection.getAuthHeader();
      Response response = await dio.get('recommendation-tips-for-user/$userId',
          options: Options(headers: header));
      return response.data['result']['recommendationTips'];
    } on CustomException catch (e) {
      throw CustomException(errorMessage: e.errorMessage);
    }
  }
}
