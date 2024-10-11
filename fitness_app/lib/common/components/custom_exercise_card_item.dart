import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:flutter/material.dart';

class CustomExerciseCardItem extends StatelessWidget {
  const CustomExerciseCardItem(
      {super.key, required this.exercise, required this.color});
  final Exercise exercise;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(
            Icons.abc,
            size: 35,
            color: color,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 90,
            child: Text(
              exercise.name,
              style: TextStyle(
                color: color,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
