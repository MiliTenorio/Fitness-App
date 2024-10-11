import 'package:fitness_app/common/components/custom_exercise_card.dart';
import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:flutter/material.dart';

class TrainingList extends StatelessWidget {
  const TrainingList({super.key, required this.exercises, required this.color});
  final List<Exercise> exercises;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: exercises.map(
            (item) {
              return CustomExerciseCard(exercise: item, color: color);
            },
          ).toList(),
        ),
      ),
    );
  }
}
