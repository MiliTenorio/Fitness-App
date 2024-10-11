import 'package:fitness_app/history/domain/entities/history_entity.dart';
import 'package:fitness_app/history/domain/usecases/get_all_history.dart';
import 'package:mobx/mobx.dart';

part 'history_store.g.dart';

class HistoryStore = _HistoryStore with _$HistoryStore;

abstract class _HistoryStore with Store {
  final GetAllHistory getAllHistory;
  _HistoryStore(this.getAllHistory);

  @observable
  List<HistoryEntity?> listHistory = [];

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchHistory() async {
    isLoading = true;
    errorMessage = null;

    try {
      listHistory = await getAllHistory();
    } catch (e) {
      errorMessage = 'Erro ao carregar históricos';
    } finally {
      isLoading = false;
    }
  }
}
