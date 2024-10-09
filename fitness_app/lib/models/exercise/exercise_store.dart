import 'package:fitness_app/database/database_helper.dart';
import 'package:fitness_app/database/models/exercise_dao.dart';
import 'package:fitness_app/database/repositories/exercise_repository.dart';
import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:mobx/mobx.dart';

part 'exercise_store.g.dart';

class ExerciseStore = _ExerciseStore with _$ExerciseStore;

abstract class _ExerciseStore with Store {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @observable
  List<ExerciseDao> exercises = ObservableList<ExerciseDao>();

  @action
  Future<void> fetchExercises() async {
    ExerciseRepository exerciseRepository = ExerciseRepository(databaseHelper);

    //exercises = await exerciseRepository.getAllExercises();
  }

  @action
  void addExercise(Exercise exercise) {
    ExerciseDao exerciseDb = ExerciseDao.covertToExerciseDB(exercise);
    ExerciseRepository exerciseRepository = ExerciseRepository(databaseHelper);

    //exerciseRepository.insertExercise(exerciseDb);
  }
}
