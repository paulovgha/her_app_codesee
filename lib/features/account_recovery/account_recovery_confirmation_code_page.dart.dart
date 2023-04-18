import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_controller.dart';
import 'package:project_cycles/core/utils/custom_form_field_validator.dart';

class AccountRecoveryConfirmationCodePage extends StatefulWidget {
  const AccountRecoveryConfirmationCodePage({super.key});

  static const route = '/account_recovery_confirmation_code_page';

  @override
  State<AccountRecoveryConfirmationCodePage> createState() =>
      _AccountRecoveryConfirmationCodePageState();
}

class _AccountRecoveryConfirmationCodePageState
    extends State<AccountRecoveryConfirmationCodePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _confirmationCodeController = TextEditingController();

  @override
  void dispose() {
    _confirmationCodeController.dispose();
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
                  accountRecoveryConfirmationCodePageTitle(context),
                  accountRecoveryConfirmationCodePageSubtitle(context),
                  Form(
                    key: _formKey,
                    child: accountRecoveryConfirmationCodeFormField(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  accountRecoveryConfirmationCodePageButton(
                      accountRecoveryController),
                  linkToAccountRecoveryPage(context),
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

  Widget accountRecoveryConfirmationCodePageTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        "Check your inbox",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget accountRecoveryConfirmationCodePageSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 32.0,
      ),
      child: Text(
        "We have sent a confirmation code to the e-mail address associated with your account. If you don't see it, please check your spam folder.",
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget accountRecoveryConfirmationCodeFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: TextFormField(
        controller: _confirmationCodeController,
        validator: CustomFormFieldValidator.validateNull,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.key_rounded),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'Confirmation Code',
          hintText: 'The code we sent to your account e-mail',
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

  Widget accountRecoveryConfirmationCodePageButton(
      AccountRecoveryController accountRecoveryController) {
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
          await accountRecoveryController.callAccountRecoveryConfirmationCode(
            code: int.parse(_confirmationCodeController.text),
          );
          log('Confirmation code ${_confirmationCodeController.text} verified successfully and navigated to the AccountRecoveryUpdatePasswordPage');
        } else {
          log('Error: Invalid confirmation code form data');
        }
      },
      child: const Text("Confirm and continue"),
    );
  }

  Widget linkToAccountRecoveryPage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Something wrong?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            log('User pressed "Request a new code" and navigated back to the AccountRecoveryPage');
          },
          child: const Text("Request a new code"),
        ),
      ],
    );
  }
}
