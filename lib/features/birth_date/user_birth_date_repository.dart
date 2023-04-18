import 'dart:convert';
import 'dart:developer';
import 'package:project_cycles/core/keys/config_keys.dart';
import 'package:project_cycles/features/birth_date/user_birth_date_services.dart';
import 'package:dio/dio.dart';
import 'package:project_cycles/services/custom_exception.dart';
import 'package:get/get.dart' as getx;
import 'package:project_cycles/services/dio_connect.dart';
import 'package:project_cycles/services/secure_storage_service.dart';

class UserBirthDateRepository extends UserBirthDateServices {
  

  UserBirthDateRepository();

  DioConnection dioConnection = getx.Get.find();

  Dio get dio => dioConnection.dio;
  final SecureStorageService secureStorageService = const SecureStorageService();
  SecureStorageService get _secureStorageService => secureStorageService;

  @override
  Future<void> patchUserBirthDate(String date) async {
    final id = await _secureStorageService.readOne(key: ConfigKeys.id);
    // final cookie = await _secureStorageService.readOne(key: ConfigKeys.cookie);


    final bodyDate = jsonEncode({'userBirthDate': date});

    try {
      Response response = await dio.patch('date-Birth-profile/$id',
          data: bodyDate);
    
      log('UserBirthDateRepository: ${response.data}');
    } on CustomException catch (e) {
      throw e.errorMessage!;
    } catch (e) {
      throw e.toString();
    }
  }
}
