import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:flutter/material.dart';

class CustomExerciseList extends StatelessWidget {
  const CustomExerciseList(
      {super.key, required this.exerciseList, required this.color});
  final List<Exercise> exerciseList;
  final Color color;

  Widget exerciseItem(Exercise exercise, dynamic context) {
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
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Card(
          child: Column(
            children: exerciseList.map(
              (item) {
                return exerciseItem(item, context);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
