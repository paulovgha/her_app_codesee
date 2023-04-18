import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/body_and_symptoms/body_and_symptoms_page.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';
import 'package:project_cycles/utils/string_utils.dart';

class CycleStatusCard extends StatelessWidget {
  CycleStatusCard({
    super.key,
  });

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
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Center(
                            child: Text(
                              'Day ${_userController.userModel.cycleModel.differenceInDays}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(
                            value: _userController
                                    .userModel.cycleModel.differenceInDays /
                                _userController.userModel.currentCycleLength,
                            color: AppColors.primary,
                            strokeWidth: 12.0,
                            backgroundColor:
                                AppColors.primary.withOpacity(0.25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${_userController.userModel.recommendationModel.currentCyclePhaseStage} days of your',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary.withOpacity(0.75),
                          ),
                        ),
                        Text(
                          '${StringUtils.capitalize(_userController.userModel.cycleModel.cyclePhaseName)} phase',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                            '${_userController.userModel.cycleModel.differenceInDays} out of ${_userController.userModel.cycleModel.cycleLength} cycle days',
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 12.0,
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.all(0),
                    childrenPadding: const EdgeInsets.only(bottom: 12.0),
                    title: Text(
                      '${_userController.userModel.recommendationModel.description.isEmpty ? "" : _userController.userModel.recommendationModel.description[0]}',
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    children: [
                      Text(
                        _userController.userModel.recommendationModel
                                .description.isEmpty
                            ? ""
                            : _userController
                                .userModel.recommendationModel.description
                                .getRange(
                                    1,
                                    _userController.userModel
                                        .recommendationModel.description.length)
                                .join('\n\n'),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(120, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, BodyAndSymptomsPage.route);
                },
                child: const Text('How are you feeling today?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
