import 'package:fitness_app/components/custom_card.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:flutter/material.dart';

class CustomExerciseList extends StatelessWidget {
  const CustomExerciseList(
      {super.key, required this.exerciseList, required this.color});
  final List<Exercise> exerciseList;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: exerciseList.map(
            (item) {
              return GestureDetector(
                onTap: () {},
                child: CustomCard(
                  title: item.name,
                  // subtitle: item.description,
                  icon: item.icon,
                  color: color,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
