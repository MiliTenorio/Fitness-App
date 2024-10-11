import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/history/presentation/screens/history_exercise_details.dart';
import 'package:fitness_app/history/presentation/screens/history_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoryModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      AppChildRoutes.initialRoute,
      child: (_) => HistoryScreen(),
    );
    r.child(
      AppChildRoutes.historyExerciseDetailsRoute,
      child: (_) => HistoryExerciseDetails(exerciseHistory: r.args.data),
    );
  }

  @override
  void binds(Injector i) {
    // i.addSingleton((i) => InMemoryHistoryRepository());
    // i.addSingleton((i) => GetAllHistory(i()));
    // i.addSingleton((i) => HistoryStore(i()));
  }
}
