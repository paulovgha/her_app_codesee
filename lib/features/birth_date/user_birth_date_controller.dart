import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_cycles/features/birth_date/user_birth_date_repository.dart';

class UserBirthDateController extends GetxController {
  final UserBirthDateRepository _userBirthDateRepository =
      UserBirthDateRepository();

  Future<void> editDateBirthProfile({
    required date,
  }) async {
    try {
      await _userBirthDateRepository.patchUserBirthDate(date);
    } catch (e) {
      log('UserBirthDateController error: $e');
    }
  }
}
