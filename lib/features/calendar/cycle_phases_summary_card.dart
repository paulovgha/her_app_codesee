import 'package:flutter/material.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/cycle/cycle_controller.dart';
import 'package:project_cycles/features/user/controller/user_controller.dart';
import 'package:project_cycles/models/cycle_model.dart';
import 'package:project_cycles/utils/calendar_utils.dart';
import 'package:get/get.dart';

class CyclePhasesSummaryCard extends StatefulWidget {
  final CyclePhases currentCyclePhase;
  const CyclePhasesSummaryCard({
    Key? key,
    required this.currentCyclePhase,
  }) : super(key: key);

  @override
  State<CyclePhasesSummaryCard> createState() => _CyclePhasesSummaryCardState();
}

class _CyclePhasesSummaryCardState extends State<CyclePhasesSummaryCard> {
  final UserController _userController = Get.find();

  CycleController cycleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                        visualDensity: const VisualDensity(
                          vertical: -4,
                        ),
                      ),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        childrenPadding: const EdgeInsets.only(
                          bottom: 12.0,
                        ),
                        title: Row(
                          children: [
                            Radio(
                              visualDensity: const VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ),
                              activeColor: widget.currentCyclePhase ==
                                      CyclePhases.menstrual
                                  ? AppColors.primary
                                  : Colors.black54,
                              value: widget.currentCyclePhase ==
                                      CyclePhases.menstrual
                                  ? 'menstrualPhase'
                                  : '',
                              groupValue: 'menstrualPhase',
                              onChanged: (String? value) {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Menstrual phase ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: widget.currentCyclePhase ==
                                          CyclePhases.menstrual
                                      ? AppColors.primary
                                      : Colors.black54,
                                ),
                              ),
                            ),
                            Text(
                              _buildStartOrLeftDays(CyclePhases.menstrual),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        children: [
                          const Text(
                            'The menstrual phase is the first phase of your cycle. It starts on the first day of your period and ends when your period ends. During this phase, your body is shedding the lining of your uterus. This is the phase when you are most likely to experience cramps and other symptoms of your period.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'First day: ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            CalendarUtils.dateTimeToStringBar(
                                                dateTime: _userController
                                                        .userModel
                                                        .cycleModel
                                                        .cycleStartDay ??
                                                    DateTime.now()),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Last day: ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            CalendarUtils.dateTimeToStringBar(
                                              dateTime: _userController
                                                  .userModel
                                                  .cycleModel
                                                  .cycleStartDay!
                                                  .add(Duration(
                                                      days: _userController
                                                              .userModel
                                                              .cycleModel
                                                              .menstrualPhaseLength ??
                                                          0)),
                                            ),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                        visualDensity: const VisualDensity(
                          vertical: -4,
                        ),
                      ),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        childrenPadding: const EdgeInsets.only(
                          bottom: 12.0,
                        ),
                        title: Row(
                          children: [
                            Radio(
                              visualDensity: const VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ),
                              activeColor: widget.currentCyclePhase ==
                                      CyclePhases.follicular
                                  ? AppColors.primary
                                  : Colors.black54,
                              value: widget.currentCyclePhase ==
                                      CyclePhases.follicular
                                  ? 'follicularPhase'
                                  : '',
                              groupValue: 'follicularPhase',
                              onChanged: (String? value) {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Follicular phase ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: widget.currentCyclePhase ==
                                          CyclePhases.follicular
                                      ? AppColors.primary
                                      : Colors.black54,
                                ),
                              ),
                            ),
                            Text(
                              _buildStartOrLeftDays(CyclePhases.follicular),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        children: [
                          const Text(
                            'The follicular phase is the second phase of your cycle. It starts after your period ends and ends when you ovulate. During this phase, your body is preparing to release an egg. Chances of getting pregnant are higher during this phase.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'First day: ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            CalendarUtils.dateTimeToStringBar(
                                              dateTime: cycleController
                                                  .initialPhaseDate(
                                                      CyclePhases.follicular),
                                            ),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Last day: ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            CalendarUtils.dateTimeToStringBar(
                                              dateTime:
                                                  cycleController.lastPhaseDate(
                                                      CyclePhases.follicular),
                                            ),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                        visualDensity: const VisualDensity(
                          vertical: -4,
                        ),
                      ),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        childrenPadding: const EdgeInsets.only(
                          bottom: 12.0,
                        ),
                        title: Row(
                          children: [
                            Radio(
                              visualDensity: const VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ),
                              activeColor: widget.currentCyclePhase ==
                                      CyclePhases.ovulatory
                                  ? AppColors.primary
                                  : Colors.black54,
                              value: widget.currentCyclePhase ==
                                      CyclePhases.ovulatory
                                  ? 'ovulatoryPhase'
                                  : '',
                              groupValue: 'ovulatoryPhase',
                              onChanged: (String? value) {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Ovulation ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: widget.currentCyclePhase ==
                                          CyclePhases.ovulatory
                                      ? AppColors.primary
                                      : Colors.black54,
                                ),
                              ),
                            ),
                            Text(
                              _buildStartOrLeftDays(CyclePhases.ovulatory),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        children: [
                          const Text(
                            'The ovulatory phase is the third phase of your cycle. It starts when you ovulate, and it is the time when you are most likely to get pregnant. You might notice changes such as increased cervical mucus and a rise in your basal body temperature.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'First day: ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            CalendarUtils.dateTimeToStringBar(
                                              dateTime: cycleController
                                                  .initialPhaseDate(
                                                      CyclePhases.ovulatory),
                                            ),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Last day: ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            CalendarUtils.dateTimeToStringBar(
                                                dateTime: cycleController
                                                    .lastPhaseDate(
                                                        CyclePhases.ovulatory)),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                        visualDensity: const VisualDensity(
                          vertical: -4,
                        ),
                      ),
                      child: ExpansionTile(
                        tilePadding: const EdgeInsets.all(0),
                        childrenPadding: const EdgeInsets.only(
                          bottom: 12.0,
                        ),
                        title: Row(
                          children: [
                            Radio(
                              visualDensity: const VisualDensity(
                                horizontal: -4,
                                vertical: -4,
                              ),
                              activeColor:
                                  widget.currentCyclePhase == CyclePhases.luteal
                                      ? AppColors.primary
                                      : Colors.black54,
                              value:
                                  widget.currentCyclePhase == CyclePhases.luteal
                                      ? 'lutealPhase'
                                      : '',
                              groupValue: 'lutealPhase',
                              onChanged: (String? value) {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Luteal phase ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: widget.currentCyclePhase ==
                                          CyclePhases.luteal
                                      ? AppColors.primary
                                      : Colors.black54,
                                ),
                              ),
                            ),
                            Text(
                              _buildStartOrLeftDays(CyclePhases.luteal),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        children: [
                          const Text(
                            'The luteal phase is the fourth and final phase of your cycle. It starts after you ovulate and ends when your period starts. It is common to experience symptoms such as breast tenderness, fatigue, and mood swings during this phase.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'First day: ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            CalendarUtils.dateTimeToStringBar(
                                                dateTime: cycleController
                                                    .initialPhaseDate(
                                                        CyclePhases.luteal)),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(6.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Last day: ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            CalendarUtils.dateTimeToStringBar(
                                                dateTime: cycleController
                                                    .lastPhaseDate(
                                                        CyclePhases.luteal)),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildStartOrLeftDays(CyclePhases actualCyclePhase) {
    if (_userController.userModel.cycleModel.cyclePhase == actualCyclePhase) {
      return '(${_userController.userModel.cycleModel.cyclePhaseLength - _userController.userModel.cycleModel.differenceInDaysByPhase} days left)';
    }
    if (cycleController
            .initialPhaseDate(actualCyclePhase)
            .add(const Duration(days: 1))
            .difference(DateTime.now())
            .inDays <=
        0) {
      return '';
    }
    return '(Starts in ${cycleController.initialPhaseDate(actualCyclePhase).add(const Duration(days: 1)).difference(DateTime.now()).inDays} days)';
  }
}
