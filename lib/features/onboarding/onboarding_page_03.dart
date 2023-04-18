import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// TODO (HALLYSON): Refatorar com GetX
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/hormonal_contraceptive/hormonal_contraceptive_controller.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_04.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';

class OnboardingPage03 extends StatefulWidget {
  static const String route = '/onboarding_page_03';
  const OnboardingPage03({Key? key}) : super(key: key);

  @override
  OnboardingPage03State createState() => OnboardingPage03State();
}

class OnboardingPage03State extends State<OnboardingPage03> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final UserController _userController = Get.find();
  final HormonalContracetiveController hormonalContraceptiveController =
      Get.put(HormonalContracetiveController());

  String _selectedValue = '';

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
                            onboardingPage03LinearProgressIndicator(),
                            onboardingPage03Title(context),
                            onboardingPage03Subtitle(context),
                            onboardingPage03RadioListTiles(),
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
                    onboardingPage03OutlinedButton(),
                    const SizedBox(
                      width: 16,
                    ),
                    onboardingPage03ElevatedButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget onboardingPage03LinearProgressIndicator() {
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
                  value: 0.5,
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

  Widget onboardingPage03Title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Text(
        'Are you currently using hormonal contraception?',
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }

  Widget onboardingPage03Subtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Text(
        'Such as pills, patches, IUD or others.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  Widget onboardingPage03RadioListTiles() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: RadioListTile(
            title: Text(
              "Yes, I am.",
              style: TextStyle(
                color: _selectedValue == 'yes'
                    ? AppColors.background
                    : Colors.black54,
              ),
            ),
            groupValue: _selectedValue,
            value: 'yes',
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black54,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            onChanged: (value) {
              setState(
                () {
                  _selectedValue = value.toString();
                  log('User selected the "Yes, I\'m" option');
                },
              );
            },
            tileColor: _selectedValue == 'yes'
                ? AppColors.primary
                : AppColors.background,
            activeColor: AppColors.onPrimary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: RadioListTile(
            title: Text(
              "No, I'm not.",
              style: TextStyle(
                color: _selectedValue == 'no'
                    ? AppColors.background
                    : Colors.black54,
              ),
            ),
            groupValue: _selectedValue,
            value: 'no',
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black54,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            onChanged: (value) {
              setState(
                () {
                  _selectedValue = value.toString();
                  log('User selected the "No, I\'m not" option');
                },
              );
            },
            tileColor: _selectedValue == 'no'
                ? AppColors.primary
                : AppColors.background,
            activeColor: AppColors.onPrimary,
          ),
        ),
      ],
    );
  }

  Widget onboardingPage03OutlinedButton() {
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
            log('User pressed "Go back" and navigated back to the OnboardingPage02');
          },
          child: const Text("Go back"),
        ),
      ),
    );
  }

  Widget onboardingPage03ElevatedButton() {
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
            if (_selectedValue != '') {
              await hormonalContraceptiveController.callHormonalContraceptive(
                  data: _selectedValue);
              _userController.userModel.cycleModel.usingHormonalContraceptive =
                  _selectedValue == 'yes' ? true : false;
              Navigator.of(context).pushNamed(OnboardingPage04.route);
              log('User pressed "Continue" and navigated to the OnboardingPage04');
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  content: const Text('Please select an option to continue'),
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
              log('Error: unable to send the user\'s hormonal contraceptive data to the API');
            }
          },
          child: const Text("Continue"),
        ),
      ),
    );
  }
}

// TODO: Debugar -> Exception caught by widgets library - Incorrect use of ParentDataWidget.