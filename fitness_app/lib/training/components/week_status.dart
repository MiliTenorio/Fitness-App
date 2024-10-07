import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/common/mock_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeekStatus extends StatelessWidget {
  const WeekStatus({super.key});

  Widget graph() {
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

  Widget graphTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$progress',
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
    return Expanded(
      child: SizedBox(
        height: 130,
        child: Stack(
          alignment: Alignment.center,
          children: [
            graph(),
            graphTitle(),
          ],
        ),
      ),
    );
  }
}
