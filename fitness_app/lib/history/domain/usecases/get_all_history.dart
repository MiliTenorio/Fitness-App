import 'package:fitness_app/history/domain/entities/history_entity.dart';
import 'package:fitness_app/history/domain/repositories/history_repository.dart';

class GetAllHistory {
  final HistoryRepository repository;

  GetAllHistory(this.repository);

  Future<List<HistoryEntity>> call() async {
    return await repository.getAllHistory();
  }
}
