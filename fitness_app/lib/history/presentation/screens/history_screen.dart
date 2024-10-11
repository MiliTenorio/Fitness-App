import 'package:fitness_app/common/components/custom_body_title.dart';
import 'package:fitness_app/common/mock_data.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/history/domain/repositories/in_history_repository.dart';
import 'package:fitness_app/history/domain/usecases/get_all_history.dart';
import 'package:fitness_app/history/presentation/components/history_list.dart';
import 'package:fitness_app/history/presentation/components/progress_card.dart';
import 'package:fitness_app/history/presentation/store/history_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final HistoryStore _store =
      HistoryStore(GetAllHistory(InMemoryHistoryRepository()));
  //Modular.get<HistoryStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProgressCard(),
          const SizedBox(
            height: 4,
          ),
          const CustomBodyTitle(
            title: Strings.titleHistoryList,
          ),
          Observer(
            builder: (context) {
              //add status check :)
              return HistoryList(
                  history: _store.listHistory ?? [deafultHistory]);
            },
          ),
          const SizedBox(
            height: 4,
          ),
          FloatingActionButton(
            onPressed: () {
              final date = DateTime.now(); // Exemplo de data
              _store.fetchHistory();
            },
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
