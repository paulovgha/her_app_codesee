import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:project_cycles/features/sign_up/sign_up_services.dart';
import 'package:project_cycles/features/sign_up/sign_up_model.dart';
import 'package:project_cycles/services/custom_exception.dart';
import 'package:get/get.dart' as getx;
import 'package:project_cycles/services/dio_connect.dart';

class SignUpRepository extends SignUpServices {
  // final SecureStorageService _secureStorageService = const SecureStorageService();

  DioConnection dioConnection = getx.Get.find();

  Dio get dio => dioConnection.dio;

  @override
  Future<void> postSignUp(SignUpModel signUpModel) async {
    try {
      Response response = await dio.post('sign-up', data: signUpModel.toJson());
      log('SignUpRepository: ${response.data}');
      return response.data;
    } on CustomException catch (e) {
      throw e.errorMessage!;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<Map<String, dynamic>> getSignUp({required String id}) async {
    final headers = await dioConnection.getAuthHeader();

    try {
      Response response =
          await dio.get('profile/$id', options: Options(headers: headers));

      final Map<String, dynamic> result = response.data['result']['profile'];
      return result;
    } on CustomException catch (e) {
      throw e.errorMessage!;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> deleteSignUp(SignUpModel signUpModel) {
    throw UnimplementedError();
  }

  @override
  Future<void> editSignUp(SignUpModel signUpModel) {
    throw UnimplementedError();
  }
}
