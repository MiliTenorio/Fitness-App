import 'package:fitness_app/components/custom_graph_card.dart';
import 'package:fitness_app/training/screens/week_progress.dart';
import 'package:fitness_app/training/screens/week_status.dart';
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
