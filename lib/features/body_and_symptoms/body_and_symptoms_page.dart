import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/body_and_symptoms/flow_symptoms_choice_chips.dart';
import 'package:project_cycles/features/body_and_symptoms/love_and_sex_choice_chips.dart';
import 'package:project_cycles/features/body_and_symptoms/menstrual_symptoms_choice_chips.dart';
import 'package:project_cycles/features/body_and_symptoms/mood_choice_chips.dart';
import 'package:project_cycles/features/body_and_symptoms/nutrition_choice_chips.dart';
import 'package:project_cycles/features/body_and_symptoms/sleep_quality_choice_chips.dart';
import 'package:project_cycles/features/body_and_symptoms/symptoms_controller.dart';
import 'package:project_cycles/features/home/custom_bottom_navigation_bar.dart';
import 'package:project_cycles/features/home/custom_drawer.dart';
import 'package:project_cycles/features/home/home_page.dart';

class BodyAndSymptomsPage extends StatefulWidget {
  const BodyAndSymptomsPage({Key? key}) : super(key: key);

  static const route = '/body_and_symptoms_page';

  @override
  State<BodyAndSymptomsPage> createState() => _BodyAndSymptomsPageState();
}

class _BodyAndSymptomsPageState extends State<BodyAndSymptomsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final SymptomsController symptomsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: const Text(
          'Body & Symptoms',
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
                Text(
                  'How are you feeling today?',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                bodyTemperatureStatusField(context),
                menstrualSymptomsStatusField(context),
                flowStatusField(context),
                sleepQualityStatusField(context),
                loveAndSexStatusField(context),
                moodStatusField(context),
                nutritionStatusField(context),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    bottom: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(120, 52),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          symptomsController.addToAllSymptoms();
                          log(symptomsController.allSymptoms.toString());
                          Navigator.of(context).pushNamed(HomePage.route);
                        },
                        child: const Text("Confirm and update"),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Update daily to get better recommendations',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(
        currentPage: 'body_and_symptoms_page',
      ),
      // floatingActionButton:  CustomFloatingActionButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: 'body_and_symptoms_page',
      ),
    );
  }

  Widget bodyTemperatureStatusField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: const ExpansionTile(
            tilePadding: EdgeInsets.all(0),
            childrenPadding: EdgeInsets.only(
              bottom: 12.0,
            ),
            trailing: SizedBox(),
            title: Row(
              children: [
                Text(
                  'Body temperature',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black54,
                    size: 18,
                  ),
                ),
              ],
            ),
            children: [
              Text(
                'Your body temperature is a good indicator of your ovulation cycle. It is usually lowest during your period and highest during ovulation. By keeping track of your temperature, we can predict when you are most likely to get pregnant.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.black54,
                        content: Text('This feature is not yet avaiable.'),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.thermostat_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '36.5 °C',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  '2 hours ago',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.black54,
                        content: Text('This feature is not yet avaiable.'),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.auto_graph_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Graph',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.black54,
                        content: Text('This feature is not yet avaiable.'),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.sync_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Sync',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget menstrualSymptomsStatusField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: const ExpansionTile(
            tilePadding: EdgeInsets.all(0),
            childrenPadding: EdgeInsets.only(
              bottom: 12.0,
            ),
            trailing: SizedBox(),
            title: Row(
              children: [
                Text(
                  'Menstrual symptoms',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black54,
                    size: 18,
                  ),
                ),
              ],
            ),
            children: [
              Text(
                'Your menstrual symptoms can be a good indicator of your ovulation cycle. By keeping track of your symptoms daily, we can make suggestions to better help you feel your best.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const MenstrualSymptomsChoiceChips(),
      ],
    );
  }

  Widget flowStatusField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: const ExpansionTile(
            tilePadding: EdgeInsets.all(0),
            childrenPadding: EdgeInsets.only(
              bottom: 12.0,
            ),
            trailing: SizedBox(),
            title: Row(
              children: [
                Text(
                  'Flow symptoms',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black54,
                    size: 18,
                  ),
                ),
              ],
            ),
            children: [
              Text(
                'Your flow symptoms can be a good indicator of your ovulation cycle. Your physiology changes throughout your cycle, and by keeping track of your symptoms daily, we can make suggestions to better help you feel your best.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const FlowSymptomsChoiceChips(),
      ],
    );
  }

  Widget sleepQualityStatusField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: const ExpansionTile(
            tilePadding: EdgeInsets.all(0),
            childrenPadding: EdgeInsets.only(
              bottom: 12.0,
            ),
            trailing: SizedBox(),
            title: Row(
              children: [
                Text(
                  'Sleep quality',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black54,
                    size: 18,
                  ),
                ),
              ],
            ),
            children: [
              Text(
                'Cycle changes can have an effect on your sleep quality. By keeping track of your sleep quality daily, we can make suggestions to better help you feel your best.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const SleepQualityChoiceChips(),
      ],
    );
  }

  Widget loveAndSexStatusField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: const ExpansionTile(
            tilePadding: EdgeInsets.all(0),
            childrenPadding: EdgeInsets.only(
              bottom: 12.0,
            ),
            trailing: SizedBox(),
            title: Row(
              children: [
                Text(
                  'Love & Sex',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black54,
                    size: 18,
                  ),
                ),
              ],
            ),
            children: [
              Text(
                'Your libido can be a good indicator of your ovulation cycle. By keeping track of your libido daily, we can make suggestions to better help you feel your best.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const LoveAndSexChoiceChips(),
      ],
    );
  }

  Widget moodStatusField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: const ExpansionTile(
            tilePadding: EdgeInsets.all(0),
            childrenPadding: EdgeInsets.only(
              bottom: 12.0,
            ),
            trailing: SizedBox(),
            title: Row(
              children: [
                Text(
                  'Mood',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black54,
                    size: 18,
                  ),
                ),
              ],
            ),
            children: [
              Text(
                'Cycle changes can have an effect on your mood. By keeping track of your mood daily, we can make suggestions to better help you feel your best.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const MoodChoiceChips(),
      ],
    );
  }

  Widget nutritionStatusField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: const ExpansionTile(
            tilePadding: EdgeInsets.all(0),
            childrenPadding: EdgeInsets.only(
              bottom: 12.0,
            ),
            trailing: SizedBox(),
            title: Row(
              children: [
                Text(
                  'Nutrition',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.black54,
                    size: 18,
                  ),
                ),
              ],
            ),
            children: [
              Text(
                'The quality of your diet can have an effect on your cycle. By keeping track of your nutrition daily, we can make suggestions to better help you feel your best.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        const NutritionChoiceChips(),
      ],
    );
  }
}
