import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_confirmation_code_page.dart.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_page.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_update_password_page.dart';
import 'package:project_cycles/features/body_and_symptoms/body_and_symptoms_page.dart';
import 'package:project_cycles/features/calendar/calendar_page.dart';
import 'package:project_cycles/features/home/home_page.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_01.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_02.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_03.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_04.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_05.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_06.dart';
import 'package:project_cycles/features/settings/settings_page.dart';
import 'package:project_cycles/features/sign_in/sign_in_page.dart';
import 'package:project_cycles/features/sign_up/sign_up_page.dart';
import 'package:project_cycles/features/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          displayMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          displaySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          headlineLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          headlineMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          headlineSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            color: Colors.black54,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          labelMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryContainer: Colors.white,
          onPrimaryContainer: Colors.black54,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          tertiary: AppColors.tertiary,
          background: AppColors.background,
        ),
      ),
      initialRoute: SplashPage.route,
      routes: {
        SplashPage.route: (_) => const SplashPage(),
        OnboardingPage01.route: (_) => const OnboardingPage01(),
        OnboardingPage02.route: (_) => const OnboardingPage02(),
        OnboardingPage03.route: (_) => const OnboardingPage03(),
        OnboardingPage04.route: (_) => const OnboardingPage04(),
        OnboardingPage05.route: (_) => const OnboardingPage05(),
        OnboardingPage06.route: (_) => const OnboardingPage06(),
        SignInPage.route: (_) => const SignInPage(),
        SignUpPage.route: (_) => const SignUpPage(),
        AccountRecoveryPage.route: (_) => const AccountRecoveryPage(),
        AccountRecoveryConfirmationCodePage.route: (_) =>
            const AccountRecoveryConfirmationCodePage(),
        AccountRecoveryUpdatePasswordPage.route: (_) =>
            const AccountRecoveryUpdatePasswordPage(),
        HomePage.route: (_) => const HomePage(),
        BodyAndSymptomsPage.route: (_) => const BodyAndSymptomsPage(),
        CalendarPage.route: (_) => const CalendarPage(),
        SettingsPage.route: (_) => const SettingsPage(),
      },
    );
  }
}
