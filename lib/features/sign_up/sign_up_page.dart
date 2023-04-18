import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/features/sign_up/sign_up_controller.dart';
import 'package:project_cycles/core/utils/custom_form_field_validator.dart';
import 'package:project_cycles/core/widgets/custom_auth_dialog.dart';
import 'package:project_cycles/features/sign_in/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const route = '/sign_up_page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneController = TextEditingController();
  bool obscureField = true;
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return /*BlocListener<SignUpController, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          const Center(child: CircularProgressIndicator());
        } else if (state is SignUpErrorState) {
          final error = (state).message;
          customAuthDialog(context,
              customMessage: error,
              customMessageButton: 'Try Again',
              customRoute: null,
              customTypeRouter: TypeRouter.pop);
          log("Sign up error: $error");
        } else if (state is SignUpSuccessState) {
          customAuthDialog(context,
              customMessage:
                  'Account created successfully! Proceed to sign in.',
              customMessageButton: 'Continue',
              customRoute: SignInPage.route,
              customTypeRouter: TypeRouter.pushReplacementNamed);
          log("Account created successfully");
        }
      },
      child:*/
        Scaffold(
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
                  signUpPageTitle(context),
                  signUpPageSubtitle(context),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: signUpFirstNameFormField(),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: signUpLastNameFormField(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: signUpCountryFormField(),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: signUpCityFormField(),
                            ),
                          ],
                        ),
                        signUpPhoneFormField(),
                        signUpEmailFormField(),
                        signUpPasswordFormField(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  signUpPageElevatedButton(signUpController),
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

  Widget signUpPageTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        "Sign up for a new account!",
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget signUpPageSubtitle(BuildContext context) {
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

  Widget signUpFirstNameFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: TextFormField(
        controller: _firstNameController,
        validator: CustomFormFieldValidator.validateNull,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.person_add_alt_1),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'First Name',
          hintText: 'Your first name',
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

  Widget signUpLastNameFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: TextFormField(
        controller: _lastNameController,
        validator: CustomFormFieldValidator.validateNull,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.person_add_alt_1),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'Last Name',
          hintText: 'Your last name',
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

  Widget signUpCountryFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: TextFormField(
        controller: _countryController,
        validator: CustomFormFieldValidator.validateNull,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.place_rounded),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'Country',
          hintText: 'Country of residence',
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

  Widget signUpCityFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: TextFormField(
        controller: _cityController,
        validator: CustomFormFieldValidator.validateNull,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.place_rounded),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'City',
          hintText: 'City of residence',
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

  Widget signUpPhoneFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: TextFormField(
        controller: _phoneController,
        validator: CustomFormFieldValidator.validateNull,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.phone_rounded),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'Phone',
          hintText: 'Your phone number',
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

  Widget signUpEmailFormField() {
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
          hintText: 'Your email address',
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

  Widget signUpPasswordFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
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

  Widget signUpPageElevatedButton(SignUpController signUpController) {
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
            await signUpController.callSignUp(
                city: _cityController.text,
                country: _countryController.text,
                email: _emailController.text,
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                password: _passwordController.text,
                phone: _phoneController.text);
            customAuthDialog(context,
                customMessage:
                    'Account created successfully! Proceed to sign in.',
                customMessageButton: 'Continue',
                customRoute: SignInPage.route,
                customTypeRouter: TypeRouter.pushReplacementNamed);

            log('User first name: ${_firstNameController.text}');
            log('User last name: ${_lastNameController.text}');
            log('User country: ${_countryController.text}');
            log('User city: ${_cityController.text}');
            log('User phone: ${_phoneController.text}');
            log('User email: ${_emailController.text}');
            log('User password: ${_passwordController.text}');
            log('Request to create new account sent to the API and navigated to the SignInPage');
          } else {
            log('Error: unable to create a new account.');
          }
        } catch (e) {
          customAuthDialog(context,
              customMessage: e.toString(),
              customMessageButton: 'Try Again',
              customRoute: null,
              customTypeRouter: TypeRouter.pop);
        }
      },
      child: const Text("Create a new account"),
    );
  }

  Row linkToSignInPage(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(SignInPage.route);
            log('User pressed "Sign in" and navigated back to the SignInPage');
          },
          child: const Text("Sign in"),
        ),
      ],
    );
  }
}
// TODO: Apresentar para o usuário instruções da criação da senha de acordo com as regras da API