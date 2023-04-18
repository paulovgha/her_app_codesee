import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/core/themes/app_image.dart';
import 'package:project_cycles/features/account_recovery/account_recovery_page.dart';
import 'package:project_cycles/features/calendar/calendar_page.dart';
import 'package:project_cycles/features/home/home_page.dart';
import 'package:project_cycles/features/onboarding/onboarding_page_01.dart';
import 'package:project_cycles/features/settings/settings_page.dart';
import 'package:project_cycles/features/sign_in/sign_in_page.dart';
import 'package:project_cycles/features/sign_up/sign_up_page.dart';
import 'package:project_cycles/features/splash/splash_page.dart';
import 'package:project_cycles/features/body_and_symptoms/body_and_symptoms_page.dart';

class CustomDrawer extends StatefulWidget {
  String currentPage;

  CustomDrawer({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  DrawerHeader(
                    child: Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(AppImages.herTransparentLogo),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: TweenAnimationBuilder(
                              duration: const Duration(seconds: 2),
                              tween: Tween<double>(begin: 0, end: 1),
                              builder:
                                  (BuildContext context, double value, _) =>
                                      CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primary.withOpacity(0.8),
                                value: value,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 12.0, 0.0, 0.0),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            widget.currentPage = 'home_page';
                          },
                        );
                        Navigator.of(context)
                            .pushReplacementNamed(HomePage.route);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                end: 12.0,
                              ),
                              child: Container(
                                width: 4.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: widget.currentPage == 'home_page'
                                      ? AppColors.primary
                                      : Colors.black54,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                end: 12.0,
                              ),
                              child: Icon(
                                Icons.home_rounded,
                                color: widget.currentPage == 'home_page'
                                    ? AppColors.primary
                                    : Colors.black54,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Home Page',
                              style: TextStyle(
                                fontWeight: widget.currentPage == 'home_page'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: widget.currentPage == 'home_page'
                                    ? AppColors.primary
                                    : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 12.0, 0.0, 0.0),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            widget.currentPage = 'body_and_symptoms_page';
                          },
                        );
                        Navigator.of(context)
                            .pushReplacementNamed(BodyAndSymptomsPage.route);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                end: 12.0,
                              ),
                              child: Container(
                                width: 4.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: widget.currentPage ==
                                          'body_and_symptoms_page'
                                      ? AppColors.primary
                                      : Colors.black54,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Icon(
                                Icons.mood_rounded,
                                color: widget.currentPage ==
                                        'body_and_symptoms_page'
                                    ? AppColors.primary
                                    : Colors.black54,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Body & Symptoms Page',
                              style: TextStyle(
                                fontWeight: widget.currentPage ==
                                        'body_and_symptoms_page'
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: widget.currentPage ==
                                        'body_and_symptoms_page'
                                    ? AppColors.primary
                                    : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 12.0, 0.0, 0.0),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            widget.currentPage = 'calendar_page';
                          },
                        );
                        Navigator.of(context)
                            .pushReplacementNamed(CalendarPage.route);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                end: 12.0,
                              ),
                              child: Container(
                                width: 4.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: widget.currentPage == 'calendar_page'
                                      ? AppColors.primary
                                      : Colors.black54,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Icon(
                                Icons.calendar_month_rounded,
                                color: widget.currentPage == 'calendar_page'
                                    ? AppColors.primary
                                    : Colors.black54,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Calendar Page',
                              style: TextStyle(
                                fontWeight:
                                    widget.currentPage == 'calendar_page'
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color: widget.currentPage == 'calendar_page'
                                    ? AppColors.primary
                                    : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 12.0, 0.0, 0.0),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            widget.currentPage = 'settings_page';
                          },
                        );
                        Navigator.of(context)
                            .pushReplacementNamed(SettingsPage.route);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                end: 12.0,
                              ),
                              child: Container(
                                width: 4.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: widget.currentPage == 'settings_page'
                                      ? AppColors.primary
                                      : Colors.black54,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: Icon(
                                Icons.settings_rounded,
                                color: widget.currentPage == 'settings_page'
                                    ? AppColors.primary
                                    : Colors.black54,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Settings Page',
                              style: TextStyle(
                                fontWeight:
                                    widget.currentPage == 'settings_page'
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                color: widget.currentPage == 'settings_page'
                                    ? AppColors.primary
                                    : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 12.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Divider(),
                        if (kDebugMode) ...[
                          Text(
                            'Development Pages',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(SplashPage.route),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: 4.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Icon(
                                        Icons.rotate_right_rounded,
                                        color: Colors.black54,
                                        size: 24.0,
                                      ),
                                    ),
                                    const Text(
                                      'Splash Page',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(SignInPage.route),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: 4.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Icon(
                                        Icons.login_rounded,
                                        color: Colors.black54,
                                        size: 24.0,
                                      ),
                                    ),
                                    const Text(
                                      'Sign-in Page',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(SignUpPage.route),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: 4.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Icon(
                                        Icons.person_add_alt_rounded,
                                        color: Colors.black54,
                                        size: 24.0,
                                      ),
                                    ),
                                    const Text(
                                      'Sign-up Page',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(AccountRecoveryPage.route),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: 4.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Icon(
                                        Icons.sync_rounded,
                                        color: Colors.black54,
                                        size: 24.0,
                                      ),
                                    ),
                                    const Text(
                                      'Recovery Page',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(OnboardingPage01.route),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: 4.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Icon(
                                        Icons.pages_rounded,
                                        color: Colors.black54,
                                        size: 24.0,
                                      ),
                                    ),
                                    const Text(
                                      'Onboarding Page',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
