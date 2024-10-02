import 'package:fitness_app/common/app_theme.dart';
import 'package:fitness_app/history/screens/history_screen.dart';
import 'package:fitness_app/newTraining/add_training_screen.dart';
import 'package:fitness_app/progress/progress_screen.dart';
import 'package:fitness_app/tab_bar_menu.dart';
import 'package:fitness_app/training/screens/training_screen.dart';
import 'package:fitness_app/update/update_screen.dart';
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
      //home: const TabBarMenu(),
      routes: {
        '/': (context) => const TabBarMenu(),
        '/training': (context) => TrainingScreen(),
        '/update': (context) => const UpdateScreen(),
        '/newTraining': (context) => const AddTrainingScreen(),
        '/iDontKnow': (context) => const ProgressScreen(),
        '/history': (context) => const HistoryScreen(),
      },
    );
  }
}
