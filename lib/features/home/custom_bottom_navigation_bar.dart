import 'package:flutter/material.dart';

import 'package:project_cycles/core/themes/app_colors.dart';
import 'package:project_cycles/features/calendar/calendar_page.dart';
import 'package:project_cycles/features/home/home_page.dart';
import 'package:project_cycles/features/settings/settings_page.dart';
import 'package:project_cycles/features/body_and_symptoms/body_and_symptoms_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  String currentPage;

  CustomBottomNavigationBar({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: SizedBox(
        height: 60.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                if (widget.currentPage != 'home_page') {
                  setState(
                    () {
                      widget.currentPage = 'home_page';
                    },
                  );
                  Navigator.of(context).pushReplacementNamed(HomePage.route);
                }
              },
              icon: Icon(
                Icons.home_rounded,
                color: widget.currentPage == 'home_page'
                    ? AppColors.primary
                    : Colors.black54,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    widget.currentPage = 'body_and_symptoms_page';
                  },
                );
                Navigator.of(context)
                    .pushReplacementNamed(BodyAndSymptomsPage.route);
              },
              icon: Icon(
                Icons.self_improvement_rounded,
                color: widget.currentPage == 'body_and_symptoms_page'
                    ? AppColors.primary
                    : Colors.black54,
              ),
            ),
            const SizedBox(),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    widget.currentPage = 'calendar_page';
                  },
                );
                Navigator.of(context).pushReplacementNamed(CalendarPage.route);
              },
              icon: Icon(
                Icons.calendar_month_rounded,
                color: widget.currentPage == 'calendar_page'
                    ? AppColors.primary
                    : Colors.black54,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    widget.currentPage = 'settings_page';
                  },
                );
                Navigator.of(context).pushReplacementNamed(SettingsPage.route);
              },
              icon: Icon(
                Icons.settings_rounded,
                color: widget.currentPage == 'settings_page'
                    ? AppColors.primary
                    : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
