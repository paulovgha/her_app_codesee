import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/cycle/cycle_controller.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';

class SymptomRecommendationsCard extends StatefulWidget {
  const SymptomRecommendationsCard({
    super.key,
  });

  @override
  State<SymptomRecommendationsCard> createState() =>
      _SymptomRecommendationsCardState();
}

class _SymptomRecommendationsCardState
    extends State<SymptomRecommendationsCard> {
  final CycleController cycleController = Get.find();
  final UserController _userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 4.0,
            bottom: 12.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                leading: const Icon(
                  Icons.sick_outlined,
                  color: AppColors.primary,
                ),
                title: Text(
                  'Symptom Recommendations',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Obx(() {
                if (cycleController.recommendationResponse.value.isCompleted &&
                    cycleController.recommendationResponse.value.data != null) {
                  return Column(
                    children: [
                      ..._userController
                          .userModel.recommendationModel.symptomRecommendations
                          .map<Widget>((symptom) {
                        return Obx(() {
                          RxBool isDone = symptom.isDone.obs;
                          return CheckboxListTile(
                            dense: true,
                            visualDensity: VisualDensity.compact,
                            activeColor: AppColors.primary,
                            title: Text(
                              '${symptom.symptom}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isDone.value
                                    ? AppColors.primary.withOpacity(0.5)
                                    : Colors.black54,
                              ),
                            ),
                            value: isDone.value,
                            onChanged: (bool? value) {
                              isDone.value = value!;
                              symptom.isDone = value;
                            },
                          );
                        });
                      })
                    ],
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
