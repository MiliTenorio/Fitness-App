import 'package:fitness_app/history/domain/entities/history_entity.dart';
import 'package:fitness_app/history/presentation/components/history_card.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key, required this.history});
  final List<HistoryEntity?> history;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: history.map(
            (item) {
              return HistoryCard(exerciseHistory: item!);
            },
          ).toList(),
        ),
      ),
    );
  }
}
