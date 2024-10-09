class Strings {
  Strings._();

  //menu
  static const String trainingSession = 'Training';
  static const String updateSession = 'Update';
  static const String newTrainingSession = 'New Training';
  static const String iDontKnowSession = 'I don\'t';
  static const String historySession = 'History';

  //Training Session
  //Resume
  static const String titleResume = 'This Week';
  static const String goalResume = 'Goal';
  static const String idontknowResume = 'I dont know';
  //Workout List
  static const String titleWorkoutList = 'Choose your workout';
  //Card
  static const String min = 'min';
  //Details Exercise
  static const String titleDetailsExercise = 'Let\'s start?!';
  //Start Training
  static const String titleStartTraining = 'You can do it!';
  static const String steps = 'Steps';
  static const String startButton = 'Start';
  static const String stopButton = 'Stop';
  static const String finishButton = 'Finish';
  static const String doneButton = 'Done';
  static const String addInfoButton = 'Add Info';

  //History Session
  //Progress Graph
  static const String titleProgressHistory = 'I will update \n the graph :)';
  //History List
  static const String titleHistoryList = 'Check your history';
  //Workout Details
  static const String titleWorkoutDetails = 'Check the exercises';

  //Images and Gifs
  static const String imageWorkoutLateralAbdominal =
      "lib/common/assets/lateral_abdominal.png";

  static const String gifWorkoutPuxadaAberta =
      'lib/common/assets/puxada_aberta.gif';
}

extension AppModuleRoutes on String {
  static const String trainingModule = "/training-module";
  static const String updateModule = "/update-module";
  static const String newTraining = "/new-training-module";
  static const String iDontKnowModule = "/i-dont-know-module";
  static const String historyModule = "/history-module";
}

extension AppChildRoutes on String {
  static const String initialRoute = "/";
  //Training Routes
  static const String trainingExerciseDetailsRoute =
      "/training-exercise-details";
  static const String startTrainingRoute = "/start-training-route";

  //History Routes
  static const String historyExerciseDetailsRoute =
      "/history-exercise-details-route";
}

extension DataBaseStrings on String {
  //Database

  //Exercises
  static final exerciseTable = 'exercisesTable';
  static final exerciseId = '_id';
  static final exerciseName = 'exerciseName';
  static final exerciseDescription = 'exerciseDescription';
  static final exerciseTypeTraining = 'exerciseTypeTraining';
  //static final exerciseImage = 'exerciseImage';
  //static final exerciseWeight = 'exerciseWeight';
}
