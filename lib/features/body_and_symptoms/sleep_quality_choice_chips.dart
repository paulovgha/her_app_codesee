import 'package:flutter/material.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_controller.dart';
import 'package:project_cycles/features/onboarding/custom_choice_chips.dart';
import 'package:get/get.dart';

class SleepQualityChoiceChips extends StatefulWidget {
  const SleepQualityChoiceChips({super.key});

  @override
  State<SleepQualityChoiceChips> createState() =>
      _SleepQualityChoiceChipsState();
}

class _SleepQualityChoiceChipsState extends State<SleepQualityChoiceChips> {
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsController;
  final SymptomsController symptomsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomChoiceChips(
      options: const [
        ChipData('Well rested', Icons.thumb_up_rounded),
        ChipData('Bad sleep', Icons.thumb_down),
        ChipData('Difficulty falling asleep', Icons.mode_night_outlined),
        ChipData('Feeling tired after walking', Icons.sick_outlined),
      ],
      onChanged: (val) {
        choiceChipsValues = val;
        if (choiceChipsValues != null && choiceChipsValues!.isNotEmpty) {
          symptomsController.sleepQuality.assignAll(choiceChipsValues!);
        }
      },
      selectedChipStyle: const ChipStyle(
        iconColor: Colors.white,
        iconSize: 20.0,
        elevation: 2.0,
        backgroundColor: AppColors.primary,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      unselectedChipStyle: const ChipStyle(
        iconColor: AppColors.primary,
        iconSize: 18.0,
        elevation: 2.0,
        backgroundColor: Colors.white54,
        textStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      chipSpacing: 8.0,
      rowSpacing: 2.0,
      multiselect: true,
      initialized: choiceChipsValues != null,
      alignment: WrapAlignment.start,
      controller: choiceChipsController ??= FormFieldController<List<String>>(
        [],
      ),
    );
  }
}
