import 'package:fitness_app/models/enum_types.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:flutter/material.dart';

class WorkoutExercises {
  final List<Exercise> exercises;
  final int? repetitions;
  final int? frequency;
  final int? min;
  final TypeTraining typeTraining;
  final String name;
  final IconData icon;
  final Color color;

  WorkoutExercises({
    required this.exercises,
    this.repetitions,
    this.frequency,
    this.min,
    required this.typeTraining,
    required this.name,
    required this.icon,
    required this.color,
  });
}
