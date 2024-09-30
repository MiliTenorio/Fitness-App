import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/components/custom_app_bar.dart';
import 'package:fitness_app/components/custom_body_title.dart';
import 'package:fitness_app/components/custom_exercise_list.dart';
import 'package:fitness_app/models/exercise_history.dart';
import 'package:flutter/material.dart';

class HistoryExerciseDetails extends StatefulWidget {
  const HistoryExerciseDetails({super.key, required this.exerciseHistory});
  final ExerciseHistory exerciseHistory;

  @override
  State<HistoryExerciseDetails> createState() => _HistoryExerciseDetailsState();
}

class _HistoryExerciseDetailsState extends State<HistoryExerciseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: widget.exerciseHistory.workoutExercises.color,
        icon: widget.exerciseHistory.workoutExercises.icon,
        title: widget.exerciseHistory.workoutExercises.name,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomBodyTitle(
                  title: Strings.titleWorkoutDetails,
                ),
                widget.exerciseHistory.workoutExercises.repetitions != null
                    ? Text(
                        '${widget.exerciseHistory.workoutExercises.repetitions!}x${widget.exerciseHistory.workoutExercises.frequency!}')
                    : Text(
                        '${widget.exerciseHistory.workoutExercises.min!} ${Strings.min}')
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CustomExerciseList(
                  exerciseList:
                      widget.exerciseHistory.workoutExercises.exercises,
                  color: widget.exerciseHistory.workoutExercises.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
