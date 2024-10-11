import 'package:fitness_app/common/mock_data.dart';
import 'package:fitness_app/history/domain/entities/history_entity.dart';
import 'package:fitness_app/history/domain/repositories/history_repository.dart';

class InMemoryHistoryRepository implements HistoryRepository {
  final List<HistoryEntity> _histories = [];

  @override
  Future<void> insertHistory(HistoryEntity history) async {
    _histories.add(history);
  }

  @override
  Future<void> updateHistory(HistoryEntity history) async {
    final index = _histories.indexWhere((h) => h.date == history.date);
    if (index != -1) {
      _histories[index] = history;
    }
  }

  @override
  Future<HistoryEntity?> getHistory(DateTime date) async {
    return _histories.firstWhere((h) => h.date == date,
        orElse: () => deafultHistory);
  }

  @override
  Future<List<HistoryEntity>> getAllHistory() async {
    return historyNewData; //_histories;
  }

  @override
  Future<void> deleteHistory(DateTime date) async {
    _histories.removeWhere((h) => h.date == date);
  }
}
