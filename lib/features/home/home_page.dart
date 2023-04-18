import 'package:flutter/material.dart';

import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/core/widgets/custom_shimmer.dart';
import 'package:project_cycles/features/cycle/cycle_controller.dart';
import 'package:project_cycles/features/home/activity_recommendations_card.dart';
import 'package:project_cycles/features/home/custom_bottom_navigation_bar.dart';
import 'package:project_cycles/features/home/custom_calendar.dart';
import 'package:project_cycles/features/home/custom_drawer.dart';
import 'package:project_cycles/features/home/custom_floating_action_button.dart';
import 'package:project_cycles/features/home/cycle_status_card.dart';
import 'package:project_cycles/features/home/profile_floating_card.dart';
import 'package:project_cycles/features/home/symptom_recommendations_card.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final CycleController cycleController = Get.find();

  @override
  void initState() {
    cycleController.getUserCycle();
    cycleController.getUserRecommendation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: const Text(
          'HER App',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProfileFloatingCard(),
                const CustomCalendar(
                  color: AppColors.primary,
                  weekFormat: true,
                  weekStartsMonday: true,
                ),
                Obx(() {
                  if (cycleController.cycleResponse.value.hasNone) {
                    return Container();
                  }
                  if (cycleController.cycleResponse.value.isLoading ||
                      cycleController.recommendationResponse.value.isLoading) {
                    return CustomShimmer(
                        child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ));
                  } else if (cycleController.cycleResponse.value.hasError) {
                    return const Text('Something went wrong');
                  } else {
                    return CycleStatusCard();
                  }
                }),
                Obx(() {
                  if (cycleController.recommendationResponse.value.hasNone) {
                    return Container();
                  } else if (cycleController
                          .recommendationResponse.value.isLoading ||
                      cycleController.cycleResponse.value.isLoading) {
                    return CustomShimmer(
                        child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ));
                  } else if (cycleController
                      .recommendationResponse.value.hasError) {
                    return const Text('');
                  } else {
                    return const ActivityRecommendationsCard();
                  }
                }),
                Obx(() {
                  if (cycleController.recommendationResponse.value.hasNone) {
                    return Container();
                  } else if (cycleController
                          .recommendationResponse.value.isLoading ||
                      cycleController.cycleResponse.value.isLoading) {
                    return CustomShimmer(
                        child: Container(
                      margin: const EdgeInsets.all(8),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ));
                  } else if (cycleController
                      .recommendationResponse.value.hasError) {
                    return const Text('');
                  } else {
                    return const SymptomRecommendationsCard();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(
        currentPage: 'home_page',
      ),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: 'home_page',
      ),
    );
  }
}
