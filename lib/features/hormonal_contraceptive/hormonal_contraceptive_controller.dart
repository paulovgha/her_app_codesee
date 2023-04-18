import 'dart:developer';
import 'package:get/get.dart';
import 'package:project_cycles/features/hormonal_contraceptive/hormonal_contraceptive_repository.dart';

class HormonalContracetiveController extends GetxController {
  final HormonalContraceptiveRepository _hormonalContraceptiveRepository =
      HormonalContraceptiveRepository();

  HormonalContracetiveController();

  Future<void> callHormonalContraceptive({
    required data,
  }) async {
    try {
      await _hormonalContraceptiveRepository.patchHormonalContraceptive(data);
    } catch (e) {
      log('HormonalContracetiveController error: $e');
    }
  }
}
