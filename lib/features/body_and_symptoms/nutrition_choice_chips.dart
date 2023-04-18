import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_controller.dart';
import 'package:project_cycles/features/onboarding/custom_choice_chips.dart';

class NutritionChoiceChips extends StatefulWidget {
  const NutritionChoiceChips({super.key});

  @override
  State<NutritionChoiceChips> createState() => _NutritionChoiceChipsState();
}

class _NutritionChoiceChipsState extends State<NutritionChoiceChips> {
  List<String>? choiceChipsValues;
  FormFieldController<List<String>>? choiceChipsController;
  final SymptomsController symptomsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomChoiceChips(
      options: const [
        ChipData('Higher appetite', Icons.fastfood_rounded),
        ChipData('Lower appetite', Icons.fastfood_outlined),
        ChipData('Craving more carbs', Icons.water_drop_outlined),
        ChipData('Craving more fats', Icons.water_drop_rounded),
        ChipData('Craving more sweets', Icons.cake_rounded),
      ],
      onChanged: (val) {
        choiceChipsValues = val;
        if (choiceChipsValues != null && choiceChipsValues!.isNotEmpty) {
          symptomsController.nutrition.assignAll(choiceChipsValues!);
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
