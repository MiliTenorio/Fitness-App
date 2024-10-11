import 'package:fitness_app/common/components/custom_card.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/history/domain/entities/history_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.exerciseHistory});
  final HistoryEntity exerciseHistory;

  //change to controller
  void _goToDetails(BuildContext context, HistoryEntity workoutExercise) {
    Modular.to.pushNamed(
        AppModuleRoutes.historyModule +
            AppChildRoutes.historyExerciseDetailsRoute,
        arguments: exerciseHistory);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _goToDetails(context, exerciseHistory);
      },
      child: CustomCard(
        title: exerciseHistory.workout.name,
        subtitle: exerciseHistory.workout.typeTraining.name,
        icon: exerciseHistory.workout.icon,
        color: exerciseHistory.workout.color,
        moreInfoOne: DateFormat('EEEE').format(exerciseHistory.date),
        moreInfoTwo:
            '${exerciseHistory.date.month}/${exerciseHistory.date.day}',
      ),
    );
  }
}
