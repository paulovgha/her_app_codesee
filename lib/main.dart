import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/app_module.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_controller.dart';
import 'package:project_cycles/features/cycle/cycle_controller.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';
import 'package:project_cycles/services/dio_connect.dart';

void main() {
  Get.put(UserController());
  Get.put(DioConnection());
  Get.put(CycleController());
  Get.put(SymptomsController());
  runApp(
    const AppModule(),
  );
  HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
