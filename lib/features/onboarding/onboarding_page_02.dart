import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/core/utils/custom_form_field_validator.dart';
import 'package:project_cycles/features/birth_date/user_birth_date_controller.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_03.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';
import 'package:project_cycles/utils/calendar_utils.dart';

class OnboardingPage02 extends StatefulWidget {
  static const String route = '/onboarding_page_02';
  const OnboardingPage02({Key? key}) : super(key: key);

  @override
  OnboardingPage02State createState() => OnboardingPage02State();
}

class OnboardingPage02State extends State<OnboardingPage02> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _birthDateController = TextEditingController();
  final UserController _userController = Get.find();
  final UserBirthDateController userBirthDateController =
      Get.put(UserBirthDateController());

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
                              onboardingPage02LinearProgressIndicator(),
                              onboardingPage02Title(context),
                              onboardingPage02Subtitle(context),
                              onboardingPage02BirthdayFormField(),
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
                      onboardingPage02OutlinedButton(),
                      const SizedBox(
                        width: 16,
                      ),
                      onboardingPage02ElevatedButton(),
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

  Widget onboardingPage02LinearProgressIndicator() {
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
                  value: 0.33,
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

  Widget onboardingPage02Title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        'When were you born?',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget onboardingPage02Subtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Text(
        'Physiological changes and life events can affect your cycle. Knowing your birthday helps us to better understand your cycle.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget onboardingPage02BirthdayFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.none,
              controller: _birthDateController,
              validator: CustomFormFieldValidator.validateNull,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.cake_rounded),
                filled: true,
                fillColor: Colors.white.withOpacity(0.5),
                labelText: 'Date of birth',
                hintText: 'Enter your birthday',
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
              onTap: () async {
                final date = await showDatePicker(
                  initialDatePickerMode: DatePickerMode.year,
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  _birthDateController.text =
                      CalendarUtils.dateTimeToStringBar(dateTime: date);
                  _userController.userModel.birthDate = date;
                  log('User selected date of birth: $date');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget onboardingPage02OutlinedButton() {
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
            log('User pressed "Go back" and navigated back to the OnboardingPage01');
          },
          child: const Text("Go back"),
        ),
      ),
    );
  }

  Widget onboardingPage02ElevatedButton() {
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
              _birthDateController.text = CalendarUtils.dateTimeYearToString(
                  dateTime: _userController.userModel.birthDate!);
              userBirthDateController.editDateBirthProfile(
                  date: _birthDateController.text);
              Navigator.of(context).pushNamed(OnboardingPage03.route);
              log('User pressed "Continue" and navigated to OnboardingPage03');
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  content: const Text(
                      'Please enter your date of birth to continue.'),
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
              log('Error: unable to send the user\'s date of birth to the API');
            }
          },
          child: const Text("Continue"),
        ),
      ),
    );
  }
}
