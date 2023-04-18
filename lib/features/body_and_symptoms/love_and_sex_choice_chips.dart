import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_controller.dart';
import 'package:project_cycles/features/onboarding/custom_choice_chips.dart';

class LoveAndSexChoiceChips extends StatefulWidget {
  const LoveAndSexChoiceChips({super.key});

  @override
  State<LoveAndSexChoiceChips> createState() => _LoveAndSexChoiceChipsState();
}

class _LoveAndSexChoiceChipsState extends State<LoveAndSexChoiceChips> {
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsController;
  final SymptomsController symptomsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomChoiceChips(
      options: const [
        ChipData('Feeling sexy', Icons.mood),
        ChipData('High desire', Icons.keyboard_double_arrow_up_rounded),
        ChipData('Low desire', Icons.keyboard_double_arrow_down_rounded),
        ChipData('Sex', Icons.spa_rounded),
        ChipData('Self-pleasure', Icons.touch_app_rounded),
        ChipData('Cuddling', Icons.join_full_rounded),
        ChipData('Intimacy with partner', Icons.join_inner_rounded),
        ChipData('Conflict', Icons.mood_bad_rounded),
      ],
      onChanged: (val) {
        choiceChipsValues = val;
        if (choiceChipsValues != null && choiceChipsValues!.isNotEmpty) {
          symptomsController.loveAndSex.assignAll(choiceChipsValues!);
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
