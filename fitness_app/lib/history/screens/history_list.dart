import 'package:fitness_app/common/mock_data.dart';
import 'package:fitness_app/history/screens/history_card.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: historyData.map(
            (item) {
              return HistoryCard(exerciseHistory: item);
            },
          ).toList(),
        ),
      ),
    );
  }
}
