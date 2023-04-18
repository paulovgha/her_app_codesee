import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/cycle/cycle_controller.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';

class ActivityRecommendationsCard extends StatefulWidget {
  const ActivityRecommendationsCard({
    super.key,
  });

  @override
  State<ActivityRecommendationsCard> createState() =>
      _ActivityRecommendationsCardState();
}

class _ActivityRecommendationsCardState
    extends State<ActivityRecommendationsCard> {
  final UserController _userController = Get.find();
  final CycleController cycleController = Get.find();

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
                  Icons.self_improvement_rounded,
                  color: AppColors.primary,
                ),
                title: Text(
                  'Activity Recommendations',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Obx(() {
                if (cycleController.cycleResponse.value.isCompleted &&
                    cycleController.cycleResponse.value.data != null) {
                  return Column(children: [
                    ..._userController.userModel.recommendationModel
                        .activityRecommendationsOrdered
                        .map<Widget>((activity) {
                      RxBool isDone = activity.isDone.obs;
                      return Obx(() {
                        return CheckboxListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          activeColor: AppColors.primary,
                          title: Text(
                            '${activity.recommendation}',
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
                            isDone.value = value ?? false;
                            activity.isDone = isDone.value;
                          },
                        );
                      });
                    })
                  ]);
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
