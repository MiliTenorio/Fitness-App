import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/components/custom_card.dart';
import 'package:fitness_app/models/exercise_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.exerciseHistory});
  final ExerciseHistory exerciseHistory;

  //change to controller
  void goToDetails(BuildContext context, ExerciseHistory workoutExercise) {
    Modular.to.pushNamed(
        AppModuleRoutes.historyModule +
            AppChildRoutes.historyExerciseDetailsRoute,
        arguments: exerciseHistory);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goToDetails(context, exerciseHistory);
      },
      child: CustomCard(
        title: exerciseHistory.workoutExercises.name,
        subtitle: exerciseHistory.workoutExercises.typeTraining.name,
        icon: exerciseHistory.workoutExercises.icon,
        color: exerciseHistory.workoutExercises.color,
        moreInfoOne: DateFormat('EEEE').format(exerciseHistory.dateTime),
        moreInfoTwo:
            '${exerciseHistory.dateTime.month}/${exerciseHistory.dateTime.day}',
      ),
    );
  }
}
