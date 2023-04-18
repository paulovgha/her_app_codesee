import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cycles/features/calendar/current_cycle_phase_status_card.dart';
import 'package:project_cycles/features/calendar/cycle_length_status_card.dart';
import 'package:project_cycles/features/calendar/cycle_phases_summary_card.dart';

import 'package:project_cycles/features/home/custom_bottom_navigation_bar.dart';
import 'package:project_cycles/features/home/custom_drawer.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  static const route = '/calendar_page';

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: const Text(
          'Calendar',
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
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      CurrentCyclePhaseStatusCard(),
                      CycleLengthStatusCard(),
                    ],
                  ),
                ),
                CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2050),
                  initialCalendarMode: DatePickerMode.day,
                  onDateChanged: (date) {
                    log('Date changed on the upper calendar: $date');
                  },
                ),
                CyclePhasesSummaryCard(
                    currentCyclePhase:
                        _userController.userModel.cycleModel.cyclePhase),
                CalendarDatePicker(
                  initialDate: DateTime.now().add(
                    Duration(
                        days:
                            _userController.userModel.cycleModel.cycleLength ??
                                1),
                  ),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2050),
                  onDateChanged: (date) {
                    log('Date changed on the lower calendar: $date');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(
        currentPage: 'calendar_page',
      ),
      // floatingActionButton: const CustomFloatingActionButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: 'calendar_page',
      ),
    );
  }
}
