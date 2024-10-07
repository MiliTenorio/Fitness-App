import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/common/mock_data.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:flutter/material.dart';

class WeekProgress extends StatelessWidget {
  const WeekProgress({super.key});

  Widget cardIconDetails(
      IconData icon, String title, double value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: color,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.disableGraph,
              ),
            ),
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget statusGraph() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$progress%',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.backgroundGrey,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.pink,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            Strings.titleResume,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          cardIconDetails(
            Icons.flag,
            Strings.goalResume,
            goal,
            AppColors.mainBlueMenu,
          ),
          const SizedBox(
            height: 4,
          ),
          cardIconDetails(
            Icons.run_circle_sharp,
            Strings.idontknowResume,
            newSomething,
            AppColors.orange,
          ),
          statusGraph(),
        ],
      ),
    );
  }
}
