import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_02.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';

class OnboardingPage01 extends StatefulWidget {
  static const String route = '/onboarding_page_01';
  const OnboardingPage01({Key? key}) : super(key: key);

  @override
  OnboardingPage01State createState() => OnboardingPage01State();
}

class OnboardingPage01State extends State<OnboardingPage01> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final UserController _userController = Get.find();

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
                            onboardingPage01LinearProgressIndicator(),
                            onboardingPage01Title(context),
                            onboardingPage01Subtitle(context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                onboardingPage01ElevatedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget onboardingPage01LinearProgressIndicator() {
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
                  value: 0.16,
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

  Widget onboardingPage01Title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        'Hi ${_userController.userModel.firstName}!',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget onboardingPage01Subtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Text(
        'We will ask you a few questions in order to create a pesonalized guidance plan, so you can keep track of your cycle with the the help of the latest and greatest scientific knowledge about the female physiology! Shall we being?',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget onboardingPage01ElevatedButton() {
    return Padding(
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
          Navigator.of(context).pushNamed(OnboardingPage02.route);
          log('User pressed "Let\'s begin!" and navigated to the OnboardingPage02');
        },
        child: const Text("Let's begin!"),
      ),
    );
  }
}
