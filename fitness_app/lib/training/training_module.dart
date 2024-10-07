import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/training/screens/start_training_screen.dart';
import 'package:fitness_app/training/screens/training_exercise_details_screen.dart';
import 'package:fitness_app/training/screens/training_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TrainingModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(AppChildRoutes.initialRoute, child: (_) => TrainingScreen());
    r.child(AppChildRoutes.trainingExerciseDetailsRoute,
        child: (_) =>
            TrainingExerciseDetailsScreen(workoutExercises: r.args.data));
    r.child(AppChildRoutes.startTrainingRoute,
        child: (_) => StartTrainingScreen(workoutExercises: r.args.data));
  }

  @override
  void binds(Injector i) {
    //i.add(TimerStore.new);
    //i.add(TimerController.new);
  }
}
