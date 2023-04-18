import 'package:flutter/material.dart';

import 'package:project_cycles/features/home/custom_bottom_navigation_bar.dart';
import 'package:project_cycles/features/home/custom_drawer.dart';
import 'package:project_cycles/features/settings/account_settings_card.dart';
import 'package:project_cycles/features/settings/application_settings_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const route = '/settings_page';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
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
          'Settings',
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
                AccountSettingsCard(),
                const ApplicationSettingsCard(),
              ],
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(
        currentPage: 'settings_page',
      ),
      // floatingActionButton: const CustomFloatingActionButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentPage: 'settings_page',
      ),
    );
  }
}
