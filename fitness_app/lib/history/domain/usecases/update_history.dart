import 'package:fitness_app/history/domain/entities/history_entity.dart';
import 'package:fitness_app/history/domain/repositories/history_repository.dart';

class UpdateHistory {
  final HistoryRepository repository;

  UpdateHistory(this.repository);

  Future<void> call(HistoryEntity history) async {
    await repository.updateHistory(history);
  }
}
