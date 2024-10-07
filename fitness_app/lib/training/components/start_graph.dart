import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/models/workout_exercises.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StartGraph extends StatelessWidget {
  const StartGraph({super.key, required this.workoutExercises});
  final WorkoutExercises workoutExercises;

  Widget graph(bool isMin, double progress) {
    return PieChart(
      PieChartData(
        startDegreeOffset: 270,
        sectionsSpace: 0,
        centerSpaceRadius: 40,
        sections: [
          PieChartSectionData(
            color: AppColors.pink,
            value: progress,
            radius: 8,
            showTitle: false,
          ),
          PieChartSectionData(
            color: AppColors.backgroundGrey,
            value: 100 - progress,
            radius: 8,
            showTitle: false,
          ),
        ],
      ),
    );
  }

  Widget graphTitle(bool isMin) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isMin
            ? Text(
                '${workoutExercises.min}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                '${workoutExercises.repetitions} x ${workoutExercises.frequency}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
        const Text(
          'goal',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: AppColors.disableGraph,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMin = workoutExercises.frequency != null ? false : true;
    //controller and observer to update
    double progress = 10;

    return Expanded(
      child: SizedBox(
        height: 130,
        child: Stack(
          alignment: Alignment.center,
          children: [
            graph(isMin, progress),
            graphTitle(isMin),
          ],
        ),
      ),
    );
  }
}
