import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/core/utils/custom_form_field_validator.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_05.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';
import 'package:project_cycles/utils/calendar_utils.dart';

class OnboardingPage04 extends StatefulWidget {
  static const String route = '/onboarding_page_04';
  const OnboardingPage04({Key? key}) : super(key: key);

  @override
  OnboardingPage04State createState() => OnboardingPage04State();
}

class OnboardingPage04State extends State<OnboardingPage04> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstDayController = TextEditingController();
  // final TextEditingController _lastDayController = TextEditingController();
  final TextEditingController _periodLenghController = TextEditingController();

  final UserController _userController = Get.find();

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
                              onboardingPage04LinearProgressIndicator(),
                              onboardingPage04Title(context),
                              onboardingPage04Subtitle(context),
                              onboardingPage04FirstDayFormField(),
                              onboardingPage04PeriodLengthFormField(),
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
                      onboardingPage04OutlinedButton(),
                      const SizedBox(
                        width: 16,
                      ),
                      onboardingPage04ElevatedButton(),
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

  Widget onboardingPage04LinearProgressIndicator() {
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
                  value: 0.66,
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

  Widget onboardingPage04Title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        'When was your last menstrual cycle?',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget onboardingPage04Subtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Text(
        'Enter the first day of your period in this cycle and the and the average length of your cycle in days. This will help us to predict your next period and cycle phases.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget onboardingPage04FirstDayFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        keyboardType: TextInputType.datetime,
        controller: _firstDayController,
        validator: CustomFormFieldValidator.validateNull,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.calendar_month_rounded),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'First day',
          hintText: 'The first day of your lastest period',
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
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (date != null) {
            _firstDayController.text =
                CalendarUtils.dateTimeToStringBar(dateTime: date);
            _userController.userModel.cycleModel.currentPeriodStartDate = date;
            log('User selected First Day: $date');
          }
        },
      ),
    );
  }

  Widget onboardingPage04PeriodLengthFormField() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _periodLenghController,
        validator: CustomFormFieldValidator.validateNull,
        decoration: InputDecoration(
          suffixIcon: const Icon(Icons.space_bar_rounded),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          labelText: 'Period length',
          hintText: 'Your period length in days',
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
          log('User changed the period length to $value');
        },
      ),
    );
  }

  Widget onboardingPage04OutlinedButton() {
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
            log('User pressed "Go back" and navigated back to the OnboardingPage03');
          },
          child: const Text("Go back"),
        ),
      ),
    );
  }

  Widget onboardingPage04ElevatedButton() {
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
              _userController.userModel.cycleModel.menstrualPhaseLength =
                  int.parse(_periodLenghController.text);
              Navigator.of(context).pushNamed(OnboardingPage05.route);
              log('User pressed "Continue" and navigated to the OnboardingPage05');
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  content: const Text(
                      'Please enter the first day of your last period and the average length of your cycle in days'),
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
              log('Error: unable to send the First Day and Period Length form data to the API');
            }
          },
          child: const Text("Continue"),
        ),
      ),
    );
  }
}
