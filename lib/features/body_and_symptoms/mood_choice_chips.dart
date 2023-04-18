import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_controller.dart';
import 'package:project_cycles/features/onboarding/custom_choice_chips.dart';

class MoodChoiceChips extends StatefulWidget {
  const MoodChoiceChips({super.key});

  @override
  State<MoodChoiceChips> createState() => _MoodChoiceChipsState();
}

class _MoodChoiceChipsState extends State<MoodChoiceChips> {
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsController;
  final SymptomsController symptomsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomChoiceChips(
      options: const [
        ChipData('Calm', Icons.self_improvement_rounded),
        ChipData('Focused', Icons.center_focus_strong_outlined),
        ChipData('Motivated', Icons.sports_handball_rounded),
        ChipData('Happy', Icons.mood_rounded),
        ChipData('Energetic', Icons.rocket_launch_rounded),
        ChipData('Sad', Icons.mood_bad_rounded),
        ChipData('Anxious', Icons.cancel_outlined),
        ChipData('Mood Swings', Icons.screen_rotation_alt_rounded),
        ChipData('Irritated', Icons.sick_outlined),
        ChipData('Stress', Icons.sick_rounded),
      ],
      onChanged: (val) {
        choiceChipsValues = val;
        if (choiceChipsValues != null && choiceChipsValues!.isNotEmpty) {
          symptomsController.mood.assignAll(choiceChipsValues!);
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
