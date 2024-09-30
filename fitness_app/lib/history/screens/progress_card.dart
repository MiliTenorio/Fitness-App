import 'package:fitness_app/components/custom_graph_card.dart';
import 'package:fitness_app/history/screens/progress_graph.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomGraphCard(
      centerWidget: ProgressGraph(),
    );
  }
}
