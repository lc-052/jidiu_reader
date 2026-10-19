import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jidiu_reader/widgets/theme_widget.dart';
import 'package:jidiu_reader/app/theme_controller.dart';

class SettingPage extends StatefulWidget {
  final ThemeController controller;
  const SettingPage({required this.controller,   super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        child: Column(
          children: [
            ThemeWidget(themeController: widget.controller),
          ],
        ),
      )
    );
  }
}
