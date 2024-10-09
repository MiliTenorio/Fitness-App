// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExerciseStore on _ExerciseStore, Store {
  late final _$exercisesAtom =
      Atom(name: '_ExerciseStore.exercises', context: context);

  @override
  List<ExerciseDao> get exercises {
    _$exercisesAtom.reportRead();
    return super.exercises;
  }

  @override
  set exercises(List<ExerciseDao> value) {
    _$exercisesAtom.reportWrite(value, super.exercises, () {
      super.exercises = value;
    });
  }

  late final _$fetchExercisesAsyncAction =
      AsyncAction('_ExerciseStore.fetchExercises', context: context);

  @override
  Future<void> fetchExercises() {
    return _$fetchExercisesAsyncAction.run(() => super.fetchExercises());
  }

  late final _$_ExerciseStoreActionController =
      ActionController(name: '_ExerciseStore', context: context);

  @override
  void addExercise(Exercise exercise) {
    final _$actionInfo = _$_ExerciseStoreActionController.startAction(
        name: '_ExerciseStore.addExercise');
    try {
      return super.addExercise(exercise);
    } finally {
      _$_ExerciseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
exercises: ${exercises}
    ''';
  }
}
