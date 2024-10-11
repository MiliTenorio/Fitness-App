// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryStore on _HistoryStore, Store {
  late final _$listHistoryAtom =
      Atom(name: '_HistoryStore.listHistory', context: context);

  @override
  List<HistoryEntity?> get listHistory {
    _$listHistoryAtom.reportRead();
    return super.listHistory;
  }

  @override
  set listHistory(List<HistoryEntity?> value) {
    _$listHistoryAtom.reportWrite(value, super.listHistory, () {
      super.listHistory = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HistoryStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_HistoryStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchHistoryAsyncAction =
      AsyncAction('_HistoryStore.fetchHistory', context: context);

  @override
  Future<void> fetchHistory() {
    return _$fetchHistoryAsyncAction.run(() => super.fetchHistory());
  }

  @override
  String toString() {
    return '''
listHistory: ${listHistory},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
