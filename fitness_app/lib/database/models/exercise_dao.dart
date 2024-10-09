import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/models/enum_types.dart';
import 'package:fitness_app/models/exercise/exercise.dart';

class ExerciseDao {
  int? id;
  String name;
  String description;
  String typeTraining;
  //String pathImage;

  ExerciseDao({
    this.id,
    required this.name,
    required this.description,
    required this.typeTraining,
    required pathImage,
  });

  ExerciseDao.fromMap(Map<dynamic, dynamic> map)
      : id = map[DataBaseStrings.exerciseId] as int,
        name = map[DataBaseStrings.exerciseName] as String,
        description = map[DataBaseStrings.exerciseDescription] as String,
        typeTraining = map[DataBaseStrings.exerciseTypeTraining] as String;

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      DataBaseStrings.exerciseName: name,
      DataBaseStrings.exerciseDescription: description,
      DataBaseStrings.exerciseTypeTraining: typeTraining,
    };

    if (id != null) {
      map[DataBaseStrings.exerciseId] = id;
    }

    return map;
  }

  @override
  String toString() {
    return '''${DataBaseStrings.exerciseTable} (
          ${DataBaseStrings.exerciseId}: $id, 
          ${DataBaseStrings.exerciseName} : $name,
          ${DataBaseStrings.exerciseDescription}: $description,
          ${DataBaseStrings.exerciseTypeTraining} : $typeTraining
        )''';
  }

  static Exercise convertToExercise(ExerciseDao exerciseDB) {
    return Exercise(
        name: exerciseDB.name,
        description: exerciseDB.description,
        typeTraining: convertToType(exerciseDB.typeTraining),
        pathImage: Strings.imageWorkoutLateralAbdominal);
  }

  static TypeTraining convertToType(String type) {
    switch (type) {
      case 'lower':
        return TypeTraining.lower;
      case 'upper':
        return TypeTraining.upper;
      case 'cardio':
        return TypeTraining.cardio;
      case 'yoga':
        return TypeTraining.yoga;
      case 'pole':
        return TypeTraining.yoga;
    }
    return TypeTraining.cardio;
  }

  static ExerciseDao covertToExerciseDB(Exercise exercise) {
    return ExerciseDao(
        name: exercise.name,
        description: exercise.description,
        typeTraining: exercise.typeTraining.toString(),
        pathImage: exercise.pathImage);
  }

  static List<Exercise> convertListToExercise(
      List<ExerciseDao> exerciseDAOList) {
    List<Exercise> exercises = [];

    for (ExerciseDao item in exerciseDAOList) {
      exercises.add(convertToExercise(item));
    }

    return exercises;
  }
}
