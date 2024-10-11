import 'package:fitness_app/common/components/custom_exercise_card_item.dart';
import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:flutter/material.dart';

class CustomExerciseList extends StatelessWidget {
  const CustomExerciseList(
      {super.key, required this.exerciseList, required this.color});
  final List<Exercise> exerciseList;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Card(
          child: Column(
            children: exerciseList.map(
              (item) {
                return CustomExerciseCardItem(exercise: item, color: color);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
