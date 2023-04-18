import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:project_cycles/features/body_and_symptoms/symptoms_model.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_services.dart';
import 'package:project_cycles/services/custom_exception.dart';
import 'package:project_cycles/services/dio_connect.dart';
import 'package:project_cycles/services/secure_storage_service.dart';

class SymptomsRepository extends SymptomsServices {
  final SecureStorageService secureStorageService =
      const SecureStorageService();

  final DioConnection dioConnection = getx.Get.find();

  Dio get dio => dioConnection.dio;

  @override
  Future<void> deleteSymptoms(SymptomsModel symptomsModel) {
    throw UnimplementedError();
  }

  @override
  Future<void> editSymptoms(SymptomsModel symptomsModel) {
    throw UnimplementedError();
  }

  @override
  Future<void> getByIdSymptoms(SymptomsModel symptomsModel) {
    throw UnimplementedError();
  }

  @override
  Future<void> getSymptoms(SymptomsModel symptomsModel) {
    throw UnimplementedError();
  }

  @override
  Future<void> postSymptoms(SymptomsModel symptomsModel) async {
    final bodyData = jsonEncode({
      "profileId": symptomsModel.profileId,
      "date": symptomsModel.date,
      "symptoms": symptomsModel.symptoms
    });

    try {
      Response response = await dio.post('symptoms', data: bodyData);

      log('SymptomsRepository: ${response.data}');
    } on CustomException catch (e) {
      throw e.errorMessage!;
    } catch (e) {
      throw e.toString();
    }
  }
}
