import 'package:fitness_app/models/enum_types.dart';
import 'package:flutter/material.dart';

class Exercise {
  final String name;
  final String description;
  final IconData icon;
  final TypeTraining typeTraining;

  Exercise({
    required this.name,
    required this.description,
    required this.icon,
    required this.typeTraining,
  });
}
