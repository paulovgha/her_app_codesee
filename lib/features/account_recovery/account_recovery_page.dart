import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_confirmation_code_page.dart.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_controller.dart';
import 'package:project_cycles/core/utils/custom_form_field_validator.dart';
import 'package:project_cycles/core/widgets/custom_auth_dialog.dart';
import 'package:project_cycles/features/sign_in/sign_in_page.dart';

class AccountRecoveryPage extends StatefulWidget {
  const AccountRecoveryPage({super.key});

  static const route = '/account_recover_page';

  @override
  State<AccountRecoveryPage> createState() => _AccountRecoveryPageState();
}

class _AccountRecoveryPageState extends State<AccountRecoveryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final accountRecoveryController = Get.put(AccountRecoveryController());

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  accountRecoveryPageTitle(context),
                  accountRecoveryPageSubtitle(context),
                  Form(
                    key: _formKey,
                    child: accountRecoveryEmailFormField(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  accountRecoveryPageElevatedButton(accountRecoveryController),
                  linkToSignInPage(context),
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

  Widget accountRecoveryPageTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        "Forgot your password?",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget accountRecoveryPageSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32.0,
      ),
      child: Text(
        "Enter your account e-mail on the field below. You will receive a confirmation code to restore access to your account.",
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget accountRecoveryEmailFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
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

  Widget accountRecoveryPageElevatedButton(
      AccountRecoveryController accountRecoveryController) {
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
            await accountRecoveryController.callAccountRecoveryRequest(
                email: _emailController.text);
            log('Account recovery request sent to ${_emailController.text} and navigated to the AccountRecoveryConfirmationCodePage');
            customAuthDialog(context,
                customMessage:
                    'A confirmation code has been sent to your email',
                customMessageButton: 'Continue',
                customRoute: AccountRecoveryConfirmationCodePage.route,
                customTypeRouter: TypeRouter.pushNamed);
            log("Confirmation code successfully sent");
          } else {
            log('Error: Invalid account e-mail form data');
          }
        } catch (e) {
          customAuthDialog(context,
              customMessage: e.toString(),
              customMessageButton: 'Try Again',
              customRoute: null,
              customTypeRouter: TypeRouter.pop);
          log("Account recovery error: $e");
        }
      },
      child: const Text("Request account recovery"),
    );
  }

  Widget linkToSignInPage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Changed your mind?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(SignInPage.route);
            log('User pressed "Go back" and navigated back to the SignInPage');
          },
          child: const Text("Go back"),
        ),
      ],
    );
  }
}
