import 'package:fitness_app/database/database_helper.dart';

class ExerciseRepository {
  final DatabaseHelper databaseHelper;
  ExerciseRepository(this.databaseHelper);

  // Future<ExerciseDb> insertExercise(ExerciseDb exercise) async {
  //   Database db = await instance
  //   exercise.id =
  //       await db.insert(DataBaseStrings.exerciseTable, exercise.toMap());

  //   db.close();
  //   return exercise;
  // }

  // Future<ExerciseDb?> getExercise(int id) async {
  //   Database db = await databaseHelper.openMyDatabase();
  //   final maps = await db.query(DataBaseStrings.exerciseTable,
  //       columns: [
  //         DataBaseStrings.exerciseId,
  //         DataBaseStrings.exerciseName,
  //         DataBaseStrings.exerciseDescription,
  //         DataBaseStrings.exerciseTypeTraining,
  //       ],
  //       where: "${DataBaseStrings.exerciseId} = ?",
  //       whereArgs: [id]);

  //   db.close();

  //   if (maps.isNotEmpty) {
  //     return ExerciseDb.fromMap(maps.first);
  //   } else {
  //     return null;
  //   }
  // }

  // Future<List<ExerciseDb>> getAllExercises() async {
  //   Database db = await databaseHelper.openMyDatabase();
  //   final maps = await db.query(DataBaseStrings.exerciseTable);

  //   return List.generate(maps.length, (i) {
  //     return ExerciseDb.fromMap(maps[i]);
  //   });
  // }

  //Implement delete and update :)
}
