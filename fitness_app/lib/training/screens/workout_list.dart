import 'package:fitness_app/models/workout_exercises.dart';
import 'package:fitness_app/training/screens/exercise_card.dart';
import 'package:flutter/material.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key, required this.workoutExercises});
  final List<WorkoutExercises> workoutExercises;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: workoutExercises.map(
            (item) {
              return ExerciseCard(
                exercise: item,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
