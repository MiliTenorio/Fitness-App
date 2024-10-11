import 'package:fitness_app/common/components/custom_graph_card.dart';
import 'package:fitness_app/training/components/week_progress.dart';
import 'package:fitness_app/training/components/week_status.dart';
import 'package:flutter/material.dart';

class ResumeCard extends StatelessWidget {
  const ResumeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomGraphCard(
      leftWidget: WeekStatus(),
      rightWidget: WeekProgress(),
    );
  }
}
