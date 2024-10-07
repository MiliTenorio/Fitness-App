import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/history/history_module.dart';
import 'package:fitness_app/newTraining/new_training_module.dart';
import 'package:fitness_app/progress/idontknow_module.dart';
import 'package:fitness_app/tabBarMenu/tarbar_module.dart';
import 'package:fitness_app/training/training_module.dart';
import 'package:fitness_app/update/updade_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: TarbarModule());
    r.module(AppModuleRoutes.trainingModule, module: TrainingModule());
    r.module(AppModuleRoutes.historyModule, module: HistoryModule());
    r.module(AppModuleRoutes.newTraining, module: NewTrainingModule());
    r.module(AppModuleRoutes.iDontKnowModule, module: IdontknowModule());
    r.module(AppModuleRoutes.updateModule, module: UpdadeModule());
  }

  @override
  void binds(Injector i) {}

  @override
  void exportedBinds(Injector i) {}
}
