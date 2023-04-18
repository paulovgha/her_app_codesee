import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/home/home_page.dart';
import 'package:project_cycles/features/onboarding/custom_choice_chips.dart';
import 'package:project_cycles/features/body_and_symptoms/menstrual_symptoms_choice_chips.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_controller.dart';

class OnboardingPage06 extends StatefulWidget {
  static const String route = '/onboarding_page_06';
  const OnboardingPage06({Key? key}) : super(key: key);

  @override
  OnboardingPage06State createState() => OnboardingPage06State();
}

class OnboardingPage06State extends State<OnboardingPage06> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final SymptomsController symptomsController = Get.find();

  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                            onboardingPage06LinearProgressIndicator(),
                            onboardingPage06Title(context),
                            onboardingPage06Subtitle(context),
                            const MenstrualSymptomsChoiceChips(),
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
                    onboardingPage06OutlinedButton(),
                    const SizedBox(
                      width: 16,
                    ),
                    onboardingPage06ElevatedButton(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget onboardingPage06LinearProgressIndicator() {
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
                  value: 1,
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

  Widget onboardingPage06Title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        'How do you feel today?',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget onboardingPage06Subtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Text(
        "Are you currently experiencing any of the following symptoms? Select all that apply.",
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget onboardingPage06OutlinedButton() {
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
            log('User pressed "Go back" and navigated back to the OnboardingPage05');
          },
          child: const Text("Go back"),
        ),
      ),
    );
  }

  Widget onboardingPage06ElevatedButton(BuildContext context) {
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
          onPressed: () async {
            symptomsController.callSymptoms();
            Navigator.of(context).pushReplacementNamed(HomePage.route);
            log('User pressed the "All done!" button and navigated to HomePage');
          },
          child: const Text("All done!"),
        ),
      ),
    );
  }
}
