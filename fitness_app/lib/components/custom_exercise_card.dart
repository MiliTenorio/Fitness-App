import 'package:fitness_app/components/custom_card.dart';
import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_app/training/components/custom_exercise_card_details.dart';
import 'package:flutter/material.dart';

class CustomExerciseCard extends StatefulWidget {
  const CustomExerciseCard(
      {super.key, required this.exercise, required this.color});
  final Exercise exercise;
  final Color color;

  @override
  State<CustomExerciseCard> createState() => _CustomExerciseCardState();
}

class _CustomExerciseCardState extends State<CustomExerciseCard> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleVisibility,
      child: Card(
        child: Column(
          children: [
            CustomCard(
              title: widget.exercise.name,
              subtitle: widget.exercise.description,
              icon: widget.exercise.icon,
              color: widget.color,
              // moreInfoOne: Icons.play_arrow,
              // moreInfoTwo: Icons.edit,
            ),
            AnimatedSize(
              duration: const Duration(
                milliseconds: 240,
              ),
              curve: Curves.easeInOut,
              child: SizedBox(
                child: _isVisible
                    ? SizedBox(
                        height: 200,
                        child: CustomExerciseCardDetails(
                          color: widget.color,
                          path: widget.exercise.pathImage,
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
