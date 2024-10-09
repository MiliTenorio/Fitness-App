import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/database/models/exercise_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //static final DatabaseHelper _instance = DatabaseHelper._internal();
  // factory DatabaseHelper() => _instance;
  // DatabaseHelper._internal();

  static final _databaseFitness = 'fitnessDatabase.db';
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  //Create database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseFitness);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    //Exercise :) update to add image/gif and weight
    await db.execute('''CREATE TABLE ${DataBaseStrings.exerciseTable} (
          ${DataBaseStrings.exerciseId} INTEGER PRIMARY KEY AUTOINCREMENT, 
          ${DataBaseStrings.exerciseName} TEXT, 
          ${DataBaseStrings.exerciseDescription} TEXT,
          ${DataBaseStrings.exerciseTypeTraining} TEXT
          )''');
    print('Banco de dados e tabela "exercises" criados com sucesso');
  }

//   //Access database
//   Future<Database> openMyDatabase() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, _databaseFitness);
//     final database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) async {
//         _initDatabase();
//       },
//     );
//     return database;
//   }

//   //Close database
//   Future close() async {
//     Database dbContact = await database;
//     dbContact.close();
//   }

  //Check database
  Future<bool> isDatabaseCreated() async {
    String path = join(await getDatabasesPath(), _databaseFitness);
    return databaseExists(path);
  }

  //

  Future<int> insertExercise(ExerciseDao exercise) async {
    Database db = await instance.database;
    return await db.insert(DataBaseStrings.exerciseTable, exercise.toMap());
  }

  Future<List<ExerciseDao>> getAllExercises() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps =
        await db.query(DataBaseStrings.exerciseTable);
    return List.generate(maps.length, (i) {
      return ExerciseDao.fromMap(maps[i]);
    });
  }
}
