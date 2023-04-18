import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_controller.dart';
import 'package:project_cycles/core/utils/custom_form_field_validator.dart';
import 'package:project_cycles/features/sign_in/sign_in_page.dart';

class AccountRecoveryUpdatePasswordPage extends StatefulWidget {
  const AccountRecoveryUpdatePasswordPage({super.key});

  static const route = '/account_recovery_update_password_page';

  @override
  State<AccountRecoveryUpdatePasswordPage> createState() =>
      _AccountRecoveryUpdatePasswordPageState();
}

class _AccountRecoveryUpdatePasswordPageState
    extends State<AccountRecoveryUpdatePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  final AccountRecoveryController accountRecoveryController =
      Get.put(AccountRecoveryController());

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
                  accountRecoveryUpdatePasswordPageTitle(context),
                  accountRecoveryUpdatePasswordPageSubtitle(context),
                  Form(
                    key: _formKey,
                    child: accountRecoveryUpdatePasswordFormField(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  accountRecoveryUpdatePasswordPageElevatedButton(),
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

  Padding accountRecoveryUpdatePasswordPageTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        "Change your password",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Padding accountRecoveryUpdatePasswordPageSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32.0,
      ),
      child: Text(
        "Enter your new password on the field below",
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Padding accountRecoveryUpdatePasswordFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: TextFormField(
        controller: _passwordController,
        validator: CustomFormFieldValidator.validatePassword,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.password_rounded),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'New password',
          hintText: 'This will be your new password',
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

  ElevatedButton accountRecoveryUpdatePasswordPageElevatedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(120, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () async {
        final valid =
            _formKey.currentState != null && _formKey.currentState!.validate();
        if (valid) {
          await accountRecoveryController.callAccountRecoveryUserPassword(
              password: _passwordController.text);
          log("New password form data ${_passwordController.text} sent to the API and navigated to the SignInPage");
        } else {
          log('Error: Invalid new password form data');
        }
      },
      child: const Text("Confirm password change"),
    );
  }

  Row linkToSignInPage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Changed your mind?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(SignInPage.route);
            log('User pressed "Back to sign in" button and navigated back to the SignInPage');
          },
          child: const Text("Back to sign in"),
        ),
      ],
    );
  }
}
