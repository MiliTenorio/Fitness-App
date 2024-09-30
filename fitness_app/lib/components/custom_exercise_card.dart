import 'package:fitness_app/components/custom_card.dart';
import 'package:fitness_app/models/exercise.dart';
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
            _isVisible
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'lib/common/assets/lateral_abdominal.png',
                        width: 120,
                        height: 120,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.play_arrow,
                              color: widget.color,
                              size: 40,
                            ),
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.edit,
                              color: widget.color,
                              size: 30,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
