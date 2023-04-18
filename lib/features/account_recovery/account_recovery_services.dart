abstract class AccountRecoveryServices {
  Future<void> postAccountRecoveryConfirmationCode(num code);
  Future<void> postAccountRecoveryRequest(String email);
  Future<void> patchAccountRecoveryUserPassword(String password);
}
