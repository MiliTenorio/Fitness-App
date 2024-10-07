import 'package:fitness_app/tabBarMenu/screens/tab_bar_menu.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TarbarModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const TabBarMenu());
  }
}
