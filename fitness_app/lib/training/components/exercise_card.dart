import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/components/custom_card.dart';
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
    Modular.to.navigate(
        AppModuleRoutes.trainingModule +
            AppChildRoutes.trainingExerciseDetailsRoute,
        arguments: workoutExercise);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => TrainingExerciseDetailsScreen(
    //       workoutExercises: workoutExercise,
    //     ),
    //   ),
    // );
  }

  //change to controller
  // void _showDialog(BuildContext context, WorkoutExercises exercise) {
  //   CustomDialog dialog = CustomDialog();
  //   dialog.showCustomDialog(
  //     context,
  //     exercise.name,
  //     'You have selected the ${exercise.name} exercise!',
  //     exercise.icon,
  //   );
  // }

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
