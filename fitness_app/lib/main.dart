import 'package:fitness_app/common/app_theme.dart';
import 'package:fitness_app/tab_bar_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: getThemeData(context),
      home: const TabBarMenu(),
    );
  }
}
