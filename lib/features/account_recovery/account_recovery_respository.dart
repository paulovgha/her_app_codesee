import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_services.dart';
import 'package:project_cycles/services/custom_exception.dart';
import 'package:get/get.dart' as getx;
import 'package:project_cycles/services/dio_connect.dart';

class AccountRecoveryRepository extends AccountRecoveryServices {
  AccountRecoveryRepository();

  late Map _id;

  DioConnection dioConnection = getx.Get.find();

  Dio get dio => dioConnection.dio;

  @override
  Future<Map> postAccountRecoveryRequest(String email) async {
    try {
      final Map<String, dynamic> mapEmail = {'email': email};
      final jsonEmail = json.encode(mapEmail);
      Response response = await dio.post('create-code', data: jsonEmail);

      _id = response.data;
      return response.data;
    } on CustomException catch (e) {
      throw e.errorMessage!;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> postAccountRecoveryConfirmationCode(num code) async {
    try {
      final Map<String, dynamic> mapCode = {
        'code': code,
        'codeId': _id["result"]["codeId"]
      };

      final jsonCode = json.encode(mapCode);

      Response response = await dio.post('confirm-code', data: jsonCode);

      return log(
          'Account Recovery Confirmation Code request: ${response.data.toString()}');
    } on CustomException catch (e) {
      throw e.errorMessage!;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> patchAccountRecoveryUserPassword(String password) async {
    try {
      final Map<String, dynamic> mapPassword = {"password": password};
      final jsonCode = json.encode(mapPassword);
      Response response = await dio
          .patch('change-password/${_id["result"]["profile"]}', data: jsonCode);

      return log(
          'Account Recovery Password Update request: ${response.data.toString()}');
    } on CustomException catch (e) {
      throw e.errorMessage!;
    } catch (e) {
      throw e.toString();
    }
  }
}
