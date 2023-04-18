import 'package:project_cycles/features/sign_up/sign_up_model.dart';

abstract class SignUpServices {
  Future<void> getSignUp({required String id});
  Future<void> postSignUp(SignUpModel signUpModel);
  Future<void> editSignUp(SignUpModel signUpModel);
  Future<void> deleteSignUp(SignUpModel signUpModel);
}
