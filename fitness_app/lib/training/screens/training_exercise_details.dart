import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/components/custom_app_bar.dart';
import 'package:fitness_app/components/custom_body_title.dart';
import 'package:fitness_app/components/custom_exercise_list.dart';
import 'package:fitness_app/models/workout_exercises.dart';
import 'package:flutter/material.dart';

class TrainingExerciseDetails extends StatefulWidget {
  const TrainingExerciseDetails({super.key, required this.workoutExercises});
  final WorkoutExercises workoutExercises;

  @override
  State<TrainingExerciseDetails> createState() =>
      _TrainingExerciseDetailsState();
}

class _TrainingExerciseDetailsState extends State<TrainingExerciseDetails> {
  @override
  Widget build(BuildContext context) {
    String info = widget.workoutExercises.repetitions != null
        ? '${widget.workoutExercises.repetitions} x ${widget.workoutExercises.frequency}'
        : '${widget.workoutExercises.min} ${Strings.min}';

    return Scaffold(
      appBar: CustomAppBar(
        color: widget.workoutExercises.color,
        icon: widget.workoutExercises.icon,
        title: widget.workoutExercises.name,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomBodyTitle(
                      title: Strings.titleDetailsExercise,
                    ),
                    Text(info)
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: CustomExerciseList(
                      exerciseList: widget.workoutExercises.exercises,
                      color: widget.workoutExercises.color,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width / 2 - 28,
              child: FloatingActionButton(
                backgroundColor: AppColors.justWhite,
                onPressed: () {
                  print('SASSSSSS');
                },
                child: Icon(
                  Icons.play_arrow,
                  color: widget.workoutExercises.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
