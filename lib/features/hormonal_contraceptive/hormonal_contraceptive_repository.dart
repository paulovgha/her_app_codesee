import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_cycles/core/keys/config_keys.dart';
import 'package:project_cycles/features/hormonal_contraceptive/hormonal_contraceptive_services.dart';
import 'package:project_cycles/services/custom_exception.dart';
import 'package:project_cycles/services/dio_connect.dart';
import 'package:get/get.dart' as getx;
import 'package:project_cycles/services/secure_storage_service.dart';

class HormonalContraceptiveRepository extends HormonalContraceptiveServices {
  final SecureStorageService _secureStorageService =
      const SecureStorageService();

  HormonalContraceptiveRepository();

  DioConnection dioConnection = getx.Get.find();
  Dio get dio => dioConnection.dio;

  @override
  Future<void> patchHormonalContraceptive(String data) async {
    final id = await _secureStorageService.readOne(key: ConfigKeys.id);
    // final cookie = await _secureStorageService.readOne(key: ConfigKeys.cookie);

    // Map<String, String> headers = {
    //   'cookie': cookie.toString(),
    //   'Content-Type': 'application/json'
    // };

    final bodyData = jsonEncode({"contraceptiveType": data});

    try {
      Response response =
          await dio.patch('contraceptive-profile/$id', data: bodyData);

      log('HormonalContraceptiveRepository: ${response.data}');
    } on CustomException catch (e) {
      throw e.errorMessage!;
    } catch (e) {
      throw e.toString();
    }
  }
}
