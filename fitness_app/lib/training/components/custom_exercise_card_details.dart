import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:flutter/material.dart';

class CustomExerciseCardDetails extends StatelessWidget {
  const CustomExerciseCardDetails({
    super.key,
    required this.color,
    required this.path,
  });
  final Color color;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          path,
          width: 120,
          height: 200,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  color,
                ),
                foregroundColor: const WidgetStatePropertyAll(
                  AppColors.backgroundWhite,
                ),
              ),
              onPressed: () {},
              child: const Text(
                Strings.doneButton,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(
                  AppColors.backgroundWhite,
                ),
                foregroundColor: WidgetStatePropertyAll(
                  color,
                ),
              ),
              onPressed: () {},
              child: const Text(
                Strings.addInfoButton,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
