import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_page.dart';
import 'package:project_cycles/features/home/home_page.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_01.dart';
import 'package:project_cycles/features/sign_up/sign_up_controller.dart';
import 'package:project_cycles/features/sign_up/sign_up_page.dart';
import 'package:project_cycles/core/utils/custom_form_field_validator.dart';
import 'package:project_cycles/core/widgets/custom_auth_dialog.dart';
import 'package:project_cycles/features/sign_in/sign_in_controller.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';
import 'package:project_cycles/models/user_model.dart';
import 'package:project_cycles/services/secure_storage_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const route = '/sign_in_page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscureField = true;
  final UserController userController = Get.find();
  int? id;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    const SecureStorageService secureStorageService = SecureStorageService();
    secureStorageService.deleteAll();
    super.initState();
  }

  final SignInController signInController = Get.put(SignInController());
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  signInPageTitle(context),
                  signInPageSubtitle(context),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        signInEmailFormField(),
                        signInPasswordFormField(),
                      ],
                    ),
                  ),
                  linkToAccountRecoveryPage(context),
                  signInPageElevatedButton(signInController),
                  linkToSignUpPage(context),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding signInPageTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        "Welcome!",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Padding signInPageSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32.0,
      ),
      child: Text(
        "Master your physiology with HER App!",
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget signInEmailFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        controller: _emailController,
        validator: CustomFormFieldValidator.validateEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.email_rounded),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'E-mail',
          hintText: 'Your account e-mail',
          hintStyle: const TextStyle(
            color: Colors.black26,
            fontSize: 14,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  Widget signInPasswordFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        controller: _passwordController,
        validator: CustomFormFieldValidator.validatePassword,
        obscureText: obscureField,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          labelText: 'Password',
          hintText: 'Your account password',
          hintStyle: const TextStyle(
            color: Colors.black26,
            fontSize: 14,
          ),
          suffixIcon: GestureDetector(
            child: obscureField
                ? const Icon(Icons.visibility_off_rounded)
                : const Icon(Icons.visibility_rounded),
            onTap: () {
              if (obscureField == true) {
                setState(
                  () {
                    obscureField = false;
                  },
                );
              } else {
                setState(
                  () {
                    obscureField = true;
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget linkToAccountRecoveryPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(AccountRecoveryPage.route);
              log('User pressed "Forgout your password?" and navigated to the AccountRecoveryPage');
            },
            child: const Text('Forgout your password?'),
          ),
        ],
      ),
    );
  }

  Widget signInPageElevatedButton(SignInController signInController) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(120, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () async {
        try {
          final valid = _formKey.currentState != null &&
              _formKey.currentState!.validate();
          if (valid) {
            String id = await signInController.callSignIn(
              email: _emailController.text,
              password: _passwordController.text,
            );
            final getSignUp = await signUpController.getSignUp(id: id);
            userController.userModel = UserModel.fromInstanceJson(getSignUp);
            log('SignUp Get Request: $getSignUp');
            if (getSignUp.containsKey("birthDate")) {
              Navigator.pushReplacementNamed(context, HomePage.route);
              log("Sign in success for existing user");
            } else {
              Navigator.pushReplacementNamed(context, OnboardingPage01.route);
              log("Sign in success for new user");
            }
          } else {
            log("Sign in error");
          }
        } catch (e) {
          customAuthDialog(context,
              customMessage: '$e. Check your password and try again.',
              customMessageButton: 'Try Again',
              customRoute: null,
              customTypeRouter: TypeRouter.pop);
          log("Sign in error: $e");
        }
      },
      child: const Text("Sign In"),
    );
  }

  Widget linkToSignUpPage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("New here?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(SignUpPage.route);
            log('User pressed "Sign up for a new account!" and navigated to the SignUpPage');
          },
          child: const Text("Sign up for a new account!"),
        ),
      ],
    );
  }
}
