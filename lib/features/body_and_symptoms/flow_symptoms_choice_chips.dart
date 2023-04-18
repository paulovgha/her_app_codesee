import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_controller.dart';
import 'package:project_cycles/features/onboarding/custom_choice_chips.dart';

class FlowSymptomsChoiceChips extends StatefulWidget {
  const FlowSymptomsChoiceChips({super.key});

  @override
  State<FlowSymptomsChoiceChips> createState() =>
      _FlowSymptomsChoiceChipsState();
}

class _FlowSymptomsChoiceChipsState extends State<FlowSymptomsChoiceChips> {
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsController;
  final SymptomsController symptomsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomChoiceChips(
      options: const [
        ChipData('No discharge', Icons.clear_rounded),
        ChipData('Sticky', Icons.water),
        ChipData('Creamy', Icons.water_drop_rounded),
        ChipData('Egg white', Icons.egg_alt_outlined),
        ChipData('Watery', Icons.water_drop_outlined),
        ChipData('Spotting', Icons.grain_rounded),
        ChipData('Light period', Icons.swipe_down_alt_outlined),
        ChipData('Normal period', Icons.swipe_down_alt_rounded),
        ChipData('Heavy period', Icons.circle),
        ChipData('Unusual', Icons.question_mark_rounded),
      ],
      onChanged: (val) {
        choiceChipsValues = val;
        if (choiceChipsValues != null && choiceChipsValues!.isNotEmpty) {
          symptomsController.flowSymptoms.assignAll(choiceChipsValues!);
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
