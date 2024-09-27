import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/training/screens/week_progress.dart';
import 'package:fitness_app/training/screens/week_status.dart';
import 'package:flutter/material.dart';

class ResumeCard extends StatelessWidget {
  const ResumeCard({super.key});

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
            WeekStatus(),
            WeekProgress(),
          ],
        ),
      ),
    );
  }
}
