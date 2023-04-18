import 'dart:developer';

import 'package:get/get.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_respository.dart';

class AccountRecoveryController extends GetxController {
  final AccountRecoveryRepository _accountRecoveryRepository =
      AccountRecoveryRepository();

  Future<void> callAccountRecoveryRequest({
    required email,
  }) async {
    try {
      await _accountRecoveryRepository.postAccountRecoveryRequest(email);
    } catch (e) {
      log("Account Recovery Request error: $e");
    }
  }

  Future<void> callAccountRecoveryConfirmationCode({required num code}) async {
    try {
      await _accountRecoveryRepository
          .postAccountRecoveryConfirmationCode(code);
    } catch (e) {
      log("Account Recovery Confirmation Code error: $e");
    }
  }

  Future<void> callAccountRecoveryUserPassword({required password}) async {
    try {
      _accountRecoveryRepository.patchAccountRecoveryUserPassword(password);
    } catch (e) {
      log("Account Recovery Update Password error: $e");
    }
  }
}
