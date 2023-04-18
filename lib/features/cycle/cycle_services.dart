import 'package:project_cycles/features/cycle/cycle_model.dart';

abstract class CycleServices {
  Future<void> getByIdCycle(CycleModelOld cycleModel);
  Future getCycle(String userId);
  Future getRecommendation(String userId);
  Future<void> postCycle(CycleModelOld cycleModel);
  Future<void> editCycle(CycleModelOld cycleModel);
  Future<void> deleteCycle(CycleModelOld cycleModel);
}
