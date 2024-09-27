import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/components/custom_card.dart';
import 'package:fitness_app/components/custom_dialog.dart';
import 'package:fitness_app/models/workout_exercises.dart';
import 'package:fitness_app/training/screens/training_exercise_details.dart';
import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.exercise,
  });

  final WorkoutExercises exercise;

  //change to controller
  void _goToDetails(BuildContext context, WorkoutExercises workoutExercise) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrainingExerciseDetails(
          workoutExercises: workoutExercise,
        ),
      ),
    );
  }

  //change to controller
  void _showDialog(BuildContext context, WorkoutExercises exercise) {
    CustomDialog dialog = CustomDialog();
    dialog.showCustomDialog(
      context,
      exercise.name,
      'You have selected the ${exercise.name} exercise!',
      exercise.icon,
    );
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
