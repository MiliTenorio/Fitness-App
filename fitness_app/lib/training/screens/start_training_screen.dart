import 'package:fitness_app/common/components/custom_app_bar.dart';
import 'package:fitness_app/common/components/custom_body_title.dart';
import 'package:fitness_app/common/components/custom_graph_card.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/models/workout_exercises.dart';
import 'package:fitness_app/training/components/start_graph.dart';
import 'package:fitness_app/training/components/training_list.dart';
import 'package:fitness_app/training/screens/timer_graph.dart';
import 'package:flutter/material.dart';

class StartTrainingScreen extends StatefulWidget {
  const StartTrainingScreen({super.key, required this.workoutExercises});
  final WorkoutExercises workoutExercises;

  @override
  State<StartTrainingScreen> createState() => _StartTrainingScreenState();
}

class _StartTrainingScreenState extends State<StartTrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: widget.workoutExercises.color,
        icon: widget.workoutExercises.icon,
        title: widget.workoutExercises.name,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBodyTitle(
              title: Strings.titleStartTraining,
            ),
            CustomGraphCard(
              leftWidget: StartGraph(workoutExercises: widget.workoutExercises),
              rightWidget: const TimerGraph(),
            ),
            TrainingList(
              exercises: widget.workoutExercises.exercises,
              color: widget.workoutExercises.color,
            ),
          ],
        ),
      ),
    );
  }
}
