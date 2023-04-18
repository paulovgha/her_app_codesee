import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_cycles/features/sign_up/sign_up_model.dart';

import 'package:project_cycles/features/sign_up/sign_up_repository.dart';

class SignUpController extends GetxController {
  final SignUpRepository _signUpRepository = SignUpRepository();

  Future<void> callSignUp(
      {required firstName,
      required lastName,
      required country,
      required city,
      required email,
      required phone,
      required password}) async {
    try {
      final signUpModel = SignUpModel(
        city: city,
        country: country,
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password,
        phone: phone,
      );

      await _signUpRepository.postSignUp(signUpModel);
    } catch (e) {
      log('SignUpController error: $e');
    }
  }

  Future<Map<String, dynamic>> getSignUp({required String id}) async {
    final Map<String, dynamic> map = await _signUpRepository.getSignUp(id: id);
    return map;
  }
}
