import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_controller.dart';
import 'package:project_cycles/features/onboarding/custom_choice_chips.dart';

class MenstrualSymptomsChoiceChips extends StatefulWidget {
  const MenstrualSymptomsChoiceChips({super.key});

  @override
  State<MenstrualSymptomsChoiceChips> createState() =>
      _MenstrualSymptomsChoiceChipsState();
}

class _MenstrualSymptomsChoiceChipsState
    extends State<MenstrualSymptomsChoiceChips> {
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsController;

  final SymptomsController symptomsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomChoiceChips(
      options: const [
        ChipData('Feeling good!', Icons.mood_rounded),
        ChipData('Cravings', Icons.fastfood_sharp),
        ChipData('Tender breasts', Icons.mode_standby_rounded),
        ChipData('Cramps', Icons.bolt),
        ChipData('Headache', Icons.mood_bad_rounded),
        ChipData('Acne', Icons.volcano_rounded),
        ChipData('Muscle pain', Icons.personal_injury_rounded),
        ChipData('Nausea', Icons.sick_outlined),
        ChipData('Bloating', Icons.open_with_sharp),
        ChipData('Constipation', Icons.thumb_down_rounded),
        ChipData('Diarrhea', Icons.swipe_down_alt_rounded),
        ChipData('Fatigue', Icons.bed_rounded),
      ],
      onChanged: (val) {
        choiceChipsValues = val;
        if (choiceChipsValues != null && choiceChipsValues!.isNotEmpty) {
          symptomsController.menstrualSymptoms.assignAll(choiceChipsValues!);
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
