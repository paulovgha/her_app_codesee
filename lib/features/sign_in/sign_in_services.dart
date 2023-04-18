import 'package:project_cycles/features/sign_in/sign_in_model.dart';

abstract class SignInServices {
  Future<void> postSignIn(SignInModel signInModel);
}
