import 'package:fitness_app/tabBarMenu/screens/tab_bar_menu.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TarbarModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const TabBarMenu());
  }

  @override
  void binds(Injector i) {
    // i.add<TrainingModule>(TrainingModule.new);
    // i.add<HistoryModule>(HistoryModule.new);
    // i.add<NewTrainingModule>(NewTrainingModule.new);
    // i.add<IdontknowModule>(IdontknowModule.new);
    // i.add<ManagerModule>(ManagerModule.new);

    // i.addSingleton((i) => InMemoryHistoryRepository());
    // i.addSingleton((i) => GetAllHistory(i()));
    // i.addSingleton((i) => HistoryStore(i()));
  }
}
