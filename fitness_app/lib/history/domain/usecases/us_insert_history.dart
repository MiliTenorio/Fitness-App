import 'package:fitness_app/history/domain/entities/history_entity.dart';
import 'package:fitness_app/history/domain/repositories/history_repository.dart';

class UsInsertHistory {
  final HistoryRepository repository;

  UsInsertHistory(this.repository);

  Future<void> call(HistoryEntity history) async {
    await repository.insertHistory(history);
  }
}
