import 'package:fitness_app/history/domain/entities/history_entity.dart';

abstract class HistoryRepository {
  Future<void> insertHistory(HistoryEntity history);
  Future<void> updateHistory(HistoryEntity history);
  Future<HistoryEntity?> getHistory(DateTime date);
  Future<List<HistoryEntity>> getAllHistory();
  Future<void> deleteHistory(DateTime date);
}
