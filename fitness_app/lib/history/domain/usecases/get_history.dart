import 'package:fitness_app/history/domain/entities/history_entity.dart';
import 'package:fitness_app/history/domain/repositories/history_repository.dart';

class GetHistory {
  final HistoryRepository repository;

  GetHistory(this.repository);

  Future<HistoryEntity?> call(DateTime date) async {
    return await repository.getHistory(date);
  }
}
