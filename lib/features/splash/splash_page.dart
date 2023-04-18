import 'package:flutter/material.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/core/themes/app_image.dart';
import 'package:project_cycles/features/sign_in/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = '/splash_page';

  @override
  State<SplashPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SplashPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SignInPage.route);
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 260,
                        height: 260,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.herTransparentLogo),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 260,
                        height: 260,
                        child: TweenAnimationBuilder(
                          duration: const Duration(seconds: 2),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (BuildContext context, double value, _) =>
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 100,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, SignInPage.route),
                    child: const Text("Continue"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
