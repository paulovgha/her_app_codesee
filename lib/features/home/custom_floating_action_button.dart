import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/core/utils/custom_form_field_validator.dart';
import 'package:project_cycles/utils/calendar_utils.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      activeBackgroundColor: AppColors.primary,
      activeForegroundColor: Colors.white,
      buttonSize: const Size(56.0, 56.0),
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => log('Show Speed Dial Options'),
      onClose: () => log('Close Speed Dial Options'),
      elevation: 8.0,
      shape: const CircleBorder(),
      spaceBetweenChildren: 16.0,
      children: [
        addPeriodChangeButton(context),
        addOvulationStatusButton(context),
      ],
    );
  }

  SpeedDialChild addPeriodChangeButton(BuildContext context) {
    return SpeedDialChild(
      child: const Icon(Icons.water_drop_rounded),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      label: 'Add period change',
      labelStyle: const TextStyle(fontSize: 12.0),
      onTap: () {
        final TextEditingController firstDayController =
            TextEditingController();
        final TextEditingController lastDayController = TextEditingController();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.zero,
              title: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: const ExpansionTile(
                  tilePadding: EdgeInsets.all(0),
                  childrenPadding: EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  title: Text(
                    'Update your period',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  children: [
                    Text(
                      'Was your period late or early this month? Update your period status to keep your cycle accurate.',
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
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.none,
                      controller: firstDayController,
                      validator: CustomFormFieldValidator.validateNull,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.water_drop_rounded),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                        labelText: 'First day',
                        hintText: 'The first day of your period',
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
                        if (date != null) {
                          firstDayController.text =
                              CalendarUtils.dateTimeToStringBar(dateTime: date);
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.none,
                      controller: lastDayController,
                      validator: CustomFormFieldValidator.validateNull,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.water_drop_outlined),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                        labelText: 'Last day',
                        hintText: 'The last day of your period',
                        hintStyle: const TextStyle(
                          color: Colors.black26,
                          fontSize: 14,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
                        if (date != null) {
                          lastDayController.text =
                              CalendarUtils.dateTimeToStringBar(dateTime: date);
                        }
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                              left: 20.0,
                              right: 20.0,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                              ),
                            ),
                            child: const Text(
                              "Confirm and update",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.black54,
                                content:
                                    Text('This feature is not yet avaiable.'),
                              ),
                            );
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  SpeedDialChild addOvulationStatusButton(BuildContext context) {
    return SpeedDialChild(
      child: const Icon(Icons.spa),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      label: 'Add ovulation status',
      labelStyle: const TextStyle(fontSize: 12.0),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.zero,
              title: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: const ExpansionTile(
                  tilePadding: EdgeInsets.all(0),
                  childrenPadding: EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  title: Text(
                    'Are you ovulating?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                  children: [
                    Text(
                      'If you checked and confirmed that you are currently ovulating, we will update your cycle to reflect this.',
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
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                    ),
                    child: RadioListTile(
                      title: Text(
                        "Yes, I am.",
                        style: TextStyle(
                          color: selectedValue == 'yes'
                              ? Colors.white
                              : Colors.black54,
                        ),
                      ),
                      groupValue: selectedValue,
                      value: 'yes',
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black54,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      tileColor: selectedValue == 'yes'
                          ? AppColors.primary
                          : Colors.white,
                      activeColor: AppColors.onPrimary,
                      onChanged: (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.black54,
                            content: Text('This feature is not yet avaiable.'),
                          ),
                        );
                        setState(
                          () {
                            selectedValue = value.toString();
                            log('selectedValue: $selectedValue');
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                    ),
                    child: RadioListTile(
                      title: Text(
                        "No, I'm not.",
                        style: TextStyle(
                          color: selectedValue == 'no'
                              ? Colors.white
                              : Colors.black54,
                        ),
                      ),
                      groupValue: selectedValue,
                      value: 'no',
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Colors.black54,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      tileColor: selectedValue == 'no'
                          ? AppColors.primary
                          : Colors.white,
                      activeColor: AppColors.onPrimary,
                      onChanged: (value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.black54,
                            content: Text('This feature is not yet avaiable.'),
                          ),
                        );
                        setState(
                          () {
                            selectedValue = value.toString();
                            log('selectedValue: $selectedValue');
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                              left: 20.0,
                              right: 20.0,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                              ),
                            ),
                            child: const Text(
                              "Confirm and update",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
