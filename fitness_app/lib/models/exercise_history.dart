import 'package:fitness_app/models/workout_exercises.dart';

class ExerciseHistory {
  final DateTime dateTime;
  final WorkoutExercises workoutExercises;
  //add SmartWatch information too

  ExerciseHistory({
    required this.dateTime,
    required this.workoutExercises,
  });
}
