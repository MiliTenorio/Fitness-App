import 'package:fitness_app/history/domain/repositories/history_repository.dart';

class DeleteHistory {
  final HistoryRepository repository;

  DeleteHistory(this.repository);

  Future<void> call(DateTime date) async {
    await repository.deleteHistory(date); //change to use id :)
  }
}
