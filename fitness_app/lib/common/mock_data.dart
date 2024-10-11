//Mock Data
import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/history/presentation/screens/history_screen.dart';
import 'package:fitness_app/manager/screens/manager_screen.dart';
import 'package:fitness_app/models/enum_types.dart';
import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:fitness_app/models/exercise_history.dart';
import 'package:fitness_app/models/workout_exercises.dart';
import 'package:fitness_app/newTraining/add_training_screen.dart';
import 'package:fitness_app/progress/progress_screen.dart';
import 'package:fitness_app/training/screens/training_screen.dart';
import 'package:flutter/material.dart';

//Screens
List<Map<String, Object>>? screens = [
  {
    'title': Strings.trainingSession,
    'screen': TrainingScreen(),
  },
  {
    'title': Strings.managerSession,
    'screen': const ManagerScreen(),
  },
  {
    'title': Strings.newTrainingSession,
    'screen': const AddTrainingScreen(),
  },
  {
    'title': Strings.iDontKnowSession,
    'screen': const ProgressScreen(),
  },
  {
    'title': Strings.historySession,
    'screen': const HistoryScreen(),
  },
];

List<Icon>? icons = [
  const Icon(
    Icons.sports_gymnastics,
    color: AppColors.justWhite,
  ),
  const Icon(
    Icons.settings,
    color: AppColors.justWhite,
  ),
  const Icon(
    Icons.add,
    color: AppColors.justWhite,
  ),
  const Icon(
    Icons.auto_graph,
    color: AppColors.justWhite,
  ),
  const Icon(
    Icons.history,
    color: AppColors.justWhite,
  ),
];

//List trainings
final List<WorkoutExercises> workoutsList = [
  workoutExercisesA,
  workoutExercisesB,
  workoutExercisesC,
  workoutExercisesD,
  workoutExercisesE,
  workoutExercisesF,
  workoutExercisesG,
  workoutExercisesH
];

//Training
WorkoutExercises workoutExercisesA = WorkoutExercises(
  exercises: [
    exerciseFour,
  ],
  repetitions: 3,
  frequency: 12,
  typeTraining: TypeTraining.upper,
  name: 'Upper Gain',
  icon: Icons.woman,
  color: AppColors.lightGreen,
);

WorkoutExercises workoutExercisesB = WorkoutExercises(
  exercises: [
    exerciseOne,
    exerciseThree,
    exerciseOne,
    exerciseTwo,
    exerciseThree,
    exerciseOne,
    exerciseThree,
    exerciseOne,
    exerciseTwo,
    exerciseThree,
  ],
  repetitions: 3,
  frequency: 12,
  typeTraining: TypeTraining.lower,
  name: 'Lower Monster',
  icon: Icons.airline_seat_legroom_normal_sharp,
  color: AppColors.purple,
);

WorkoutExercises workoutExercisesC = WorkoutExercises(
  exercises: [
    exerciseOne,
    exerciseTwo,
    exerciseThree,
  ],
  min: 120,
  typeTraining: TypeTraining.cardio,
  name: 'Cardio Hard',
  icon: Icons.directions_run,
  color: AppColors.green,
);

WorkoutExercises workoutExercisesD = WorkoutExercises(
  exercises: [
    exerciseFour,
  ],
  min: 60,
  typeTraining: TypeTraining.yoga,
  name: 'Yoga',
  icon: Icons.accessibility_new,
  color: AppColors.yellow,
);

WorkoutExercises workoutExercisesE = WorkoutExercises(
  exercises: [
    exerciseFour,
  ],
  repetitions: 3,
  frequency: 12,
  typeTraining: TypeTraining.upper,
  name: 'Upper Nothing',
  icon: Icons.woman,
  color: AppColors.lightGreen,
);

WorkoutExercises workoutExercisesF = WorkoutExercises(
  exercises: [
    exerciseOne,
    exerciseThree,
  ],
  repetitions: 3,
  frequency: 12,
  typeTraining: TypeTraining.lower,
  name: 'Lower Just do it',
  icon: Icons.airline_seat_legroom_normal_sharp,
  color: AppColors.purple,
);

WorkoutExercises workoutExercisesG = WorkoutExercises(
  exercises: [
    exerciseOne,
    exerciseTwo,
    exerciseThree,
  ],
  min: 60,
  typeTraining: TypeTraining.cardio,
  name: 'Cardio OK',
  icon: Icons.directions_run,
  color: AppColors.green,
);

WorkoutExercises workoutExercisesH = WorkoutExercises(
  exercises: [
    exerciseOne,
    exerciseThree,
    exerciseOne,
    exerciseTwo,
    exerciseThree,
    exerciseOne,
    exerciseThree,
    exerciseOne,
    exerciseTwo,
    exerciseThree,
  ],
  repetitions: 3,
  frequency: 12,
  typeTraining: TypeTraining.lower,
  name:
      'Lower Monster Nome Longo Lower Monster Nome Longo Lower Monster Nome Longo',
  icon: Icons.airline_seat_legroom_normal_sharp,
  color: AppColors.purple,
);

//Exercises
Exercise exerciseOne = Exercise(
    name: 'Exercise 1 Nome Longo Exercise 1 Exercise 1 Nome Longo Exercise 1',
    description:
        'Exercise 1 description Descrição Longaaaa Exercise 1 description Exercise 1 description Exercise 1 description Exercise 1 description Exercise 1 description Exercise 1 description Exercise 1 description',
    typeTraining: TypeTraining.cardio,
    pathImage: Strings.imageWorkoutLateralAbdominal);

Exercise exerciseTwo = Exercise(
    name: 'Exercise 2',
    description: 'Exercise 2 description',
    typeTraining: TypeTraining.cardio,
    pathImage: Strings.gifWorkoutPuxadaAberta);

Exercise exerciseThree = Exercise(
    name: 'Exercise 3',
    description: 'Exercise 3 description',
    typeTraining: TypeTraining.lower,
    pathImage: Strings.imageWorkoutLateralAbdominal);

Exercise exerciseFour = Exercise(
    name: 'Exercise 2',
    description: 'Exercise 2 description',
    typeTraining: TypeTraining.upper,
    pathImage: Strings.gifWorkoutPuxadaAberta);

//Resume Data
double progress = 40.0;
double goal = 7;
double newSomething = 18;

//History Data
List<ExerciseHistory> historyData = [
  exerciseHistoryOne,
  exerciseHistoryTwo,
  exerciseHistoryThree,
  exerciseHistoryFour,
];

ExerciseHistory exerciseHistoryOne = ExerciseHistory(
  dateTime: DateTime(2024, 09, 20),
  workoutExercises: workoutExercisesA,
);

ExerciseHistory exerciseHistoryTwo = ExerciseHistory(
  dateTime: DateTime(2024, 09, 21),
  workoutExercises: workoutExercisesB,
);

ExerciseHistory exerciseHistoryThree = ExerciseHistory(
  dateTime: DateTime(2024, 09, 23),
  workoutExercises: workoutExercisesC,
);

ExerciseHistory exerciseHistoryFour = ExerciseHistory(
  dateTime: DateTime(2024, 09, 24),
  workoutExercises: workoutExercisesE,
);

final List<String> listTypeTrainings = [
  TypeTraining.cardio.name,
  TypeTraining.lower.name,
  TypeTraining.upper.name,
  TypeTraining.pole.name,
  TypeTraining.yoga.name,
];
