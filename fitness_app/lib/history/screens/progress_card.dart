import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/history/screens/progress_graph.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: AppColors.backgroundWhite,
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            ProgressGraph(),
          ],
        ),
      ),
    );
  }
}
