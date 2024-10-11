import 'package:fitness_app/common/components/custom_body_title.dart';
import 'package:fitness_app/common/mock_data.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/models/workout_exercises.dart';
import 'package:fitness_app/training/components/resume_card.dart';
import 'package:fitness_app/training/components/workout_list.dart';
import 'package:flutter/material.dart';

class TrainingScreen extends StatelessWidget {
  TrainingScreen({super.key});

  final List<WorkoutExercises> workoutExercises = workoutsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ResumeCard(),
          const SizedBox(
            height: 4,
          ),
          const CustomBodyTitle(
            title: Strings.titleWorkoutList,
          ),
          WorkoutList(workoutExercises: workoutsList),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
