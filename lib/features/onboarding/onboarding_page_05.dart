import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/core/utils/custom_form_field_validator.dart';
import 'package:project_cycles/features/cycle/cycle_controller.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_06.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';
import 'package:get/get.dart';

class OnboardingPage05 extends StatefulWidget {
  static const String route = '/onboarding_page_05';
  const OnboardingPage05({Key? key}) : super(key: key);

  @override
  OnboardingPage05State createState() => OnboardingPage05State();
}

class OnboardingPage05State extends State<OnboardingPage05> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final UserController _userController = Get.find();
  final TextEditingController _cycleLengthController = TextEditingController();
  final CycleController cycleController = Get.put(CycleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              onboardingPage05LinearProgressIndicator(),
                              onboardingPage05Title(context),
                              onboardingPage05Subtitle(context),
                              onboardingPage05CycleLenghtFormField(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      onboardingPage05OutlinedButton(),
                      const SizedBox(
                        width: 16,
                      ),
                      onboardingPage05ElevatedButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget onboardingPage05LinearProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                height: 8.0,
                child: LinearProgressIndicator(
                  value: 0.83,
                  color: AppColors.primary,
                  backgroundColor: AppColors.primary.withOpacity(0.25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget onboardingPage05Title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        'On average, how long are your menstrual cycles?',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget onboardingPage05Subtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Text(
        "The lenght of your entire menstrual cycle.  This usually ranges between 23 and 35 days for most people, but if you can't remember yours specifically, you can enter the average lenght of 28 days for now.",
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget onboardingPage05CycleLenghtFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _cycleLengthController,
        validator: CustomFormFieldValidator.validateNull,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.date_range_rounded),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'Cycle lenght',
          hintText: 'The lenght of your entire cycle in days',
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
        onChanged: (value) {
          log('User changed the cycle lenght to $value');
        },
      ),
    );
  }

  Widget onboardingPage05OutlinedButton() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 56.0,
        ),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(120, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            log('User pressed "Go back" and navigated back to the OnboardingPage04');
          },
          child: const Text("Go back"),
        ),
      ),
    );
  }

  Widget onboardingPage05ElevatedButton() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 56.0,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(120, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            final valid = _formKey.currentState != null &&
                _formKey.currentState!.validate();
            if (valid) {
              _userController.userModel.cycleModel.cycleLength =
                  int.tryParse(_cycleLengthController.text);
              cycleController.callCycle();
              Navigator.of(context).pushNamed(OnboardingPage06.route);
              log('User pressed "Continue" and navigated to the OnboardingPage06');
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  content: const Text(
                      'Please enter the cycle length in days to continue'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        log('User pressed the "OK" button and closed the dialog');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
              log('Error sending the cycle length form data to the API');
            }
          },
          child: const Text("Continue"),
        ),
      ),
    );
  }
}
