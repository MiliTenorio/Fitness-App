import 'package:fitness_app/database/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class FitnessDatabase {
  DatabaseHelper databaseHelper = DatabaseHelper.instance;

  Database? _db;

  // Future<ExerciseDb> addExercise(ExerciseDb newExercise) async {
  //   _db = await databaseHelper.openMyDatabase();

  //   newExercise.id = (await _db?.insert(
  //     DataBaseStrings.exerciseTable,
  //     newExercise.toMap(),
  //   ))!;
  //   return newExercise;
  // }

  // Future<ExerciseDb?> getExercise(int id) async {
  //   _db = await databaseHelper.openMyDatabase();
  //   List<Map> maps = await _db!.query(DataBaseStrings.exerciseTable,
  //       columns: [
  //         DataBaseStrings.exerciseId,
  //         DataBaseStrings.exerciseName,
  //         DataBaseStrings.exerciseDescription,
  //         DataBaseStrings.exerciseTypeTraining
  //       ],
  //       where: "${DataBaseStrings.exerciseId} = ?",
  //       whereArgs: [id]);

  //   if (maps.isNotEmpty) {
  //     return ExerciseDb.fromMap(maps.first);
  //   } else {
  //     return null;
  //   }
  // }

  // static Future<List<ExerciseDb>> getAllExercises() async {
  //   final _db = await DatabaseHelper.openMyDatabase();
  //   List<Map> maps =
  //       await _db.rawQuery("SELECT * FROM ${DataBaseStrings.exerciseTable}");
  //   List<ExerciseDb> listExercises = List.empty();

  //   for (Map m in maps) {
  //     listExercises.add(ExerciseDb.fromMap(m));
  //   }
  //   return listExercises;
  // }
}
