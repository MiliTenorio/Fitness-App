import 'package:fitness_app/common/components/custom_body_title.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/history/presentation/components/history_list.dart';
import 'package:fitness_app/history/presentation/components/progress_card.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProgressCard(),
          SizedBox(
            height: 4,
          ),
          CustomBodyTitle(
            title: Strings.titleHistoryList,
          ),
          HistoryList(),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
