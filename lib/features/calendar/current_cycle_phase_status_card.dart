import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';

class CurrentCyclePhaseStatusCard extends StatelessWidget {
  CurrentCyclePhaseStatusCard({
    super.key,
  });

  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value: _userController
                                .userModel.cycleModel.differenceInDaysByPhase /
                            _userController
                                .userModel.cycleModel.cyclePhaseLength,
                        strokeWidth: 8,
                        backgroundColor: AppColors.primary.withOpacity(0.2),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.water_drop_rounded,
                      color: AppColors.primary,
                      size: 40,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Day ${_userController.userModel.cycleModel.differenceInDaysByPhase}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    ' of ${_userController.userModel.cycleModel.cyclePhaseLength}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  '${_userController.userModel.cycleModel.cyclePhaseName} phase',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
