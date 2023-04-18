import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:project_cycles/features/sign_in/sign_in_model.dart';
import 'package:project_cycles/features/sign_in/sign_in_services.dart';
import 'package:project_cycles/services/custom_exception.dart';
import 'package:project_cycles/services/dio_connect.dart';

class SignInRepository implements SignInServices {
  SignInRepository();

  DioConnection dioConnection = getx.Get.find();
  Dio get dio => dioConnection.dio;

  @override
  Future<Map> postSignIn(SignInModel signInModel) async {
    try {
      Response response = await dio.post('login', data: signInModel.toJson());

      log(response.data.toString());
      log(response.headers.toString());

      // final cookie = response.headers['Set-Cookie']?[0];

      final responseData = {};
      responseData['body'] = response.data;
      //TODO: após apresentaçao, implementar cookies novamente
      // responseData['cookie'] = cookie;

      return responseData;
    } on CustomException catch (e) {
      throw e.errorMessage!;
    } catch (e) {
      throw e.toString();
    }
  }
}
