import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_cycles/features/activies/activities_repository.dart';
import 'package:project_cycles/features/activies/activities_model.dart';

class ActivitiesController extends GetxController {
  final ActivitiesRepository _activitiesRepository = ActivitiesRepository();

  ActivitiesController();

  Future<void> callActivities({
    required activeDescription,
    required activeName,
    required checklist,
  }) async {
    const id = "689049e0-510e-45b4-ada4-23cbc8a74d15";

    final activitiesModel = ActivitiesModel(
      profileId: id,
      activeDescription: activeDescription,
      activeName: activeName,
      checklist: checklist,
    );

    try {
      await _activitiesRepository.postActivities(activitiesModel);
    } catch (e) {
      log(
        e.toString(),
      );
    }
  }
}
