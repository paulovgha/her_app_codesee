import 'dart:developer';

import 'package:get/get.dart';
import 'package:project_cycles/features/sign_in/sign_in_repository.dart';
import 'package:project_cycles/core/keys/config_keys.dart';
import 'package:project_cycles/features/sign_in/sign_in_model.dart';
import 'package:project_cycles/services/custom_exception.dart';
import 'package:project_cycles/services/secure_storage_service.dart';

class SignInController extends GetxController {
  final SignInRepository _signInRepository = SignInRepository();
  final SecureStorageService _secureStorageService =
      const SecureStorageService();

  RxBool isLoading = false.obs;

  Future<String> callSignIn({
    required email,
    required password,
  }) async {
    try {
      isLoading.value = true;
      final signInModel = SignInModel(
        email: email,
        password: password,
      );

      final apiResponse = await _signInRepository.postSignIn(signInModel);

      final id = apiResponse['body']['result']['userId'];
      // final cookie = apiResponse['cookie'];

      log('id: $id');

      // log('cookie: $cookie');

      _secureStorageService.write(
        key: ConfigKeys.id,
        value: id,
      );

      // _secureStorageService.write(
      //   key: ConfigKeys.cookie,
      //   value: cookie,
      // );
      return id;
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
