import 'package:fitness_app/common/components/custom_card.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/models/workout_exercises.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.exercise,
  });

  final WorkoutExercises exercise;

  //change to controller
  void _goToDetails(BuildContext context, WorkoutExercises workoutExercise) {
    Modular.to.pushNamed(
        AppModuleRoutes.trainingModule +
            AppChildRoutes.trainingExerciseDetailsRoute,
        arguments: workoutExercise);
  }

  @override
  Widget build(BuildContext context) {
    String info = exercise.repetitions != null
        ? '${exercise.repetitions} x ${exercise.frequency}'
        : '${exercise.min} ${Strings.min}';

    return GestureDetector(
      onTap: () {
        _goToDetails(context, exercise);
      },
      child: CustomCard(
        title: exercise.name,
        subtitle: exercise.typeTraining.name,
        icon: exercise.icon,
        color: exercise.color,
        moreInfoOne: info,
      ),
    );
  }
}
