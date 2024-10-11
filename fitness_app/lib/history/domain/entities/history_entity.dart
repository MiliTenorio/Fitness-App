import 'package:fitness_app/models/workout_exercises.dart';

class HistoryEntity {
  final DateTime date;
  final WorkoutExercises workout; //Change to EntityWorkout :)
  final Duration timer;
  final int? repetitions;
  final int? frequency;
  final int? minutes;

  HistoryEntity({
    required this.date,
    required this.workout,
    required this.timer,
    this.repetitions,
    this.frequency,
    this.minutes,
  });
}
