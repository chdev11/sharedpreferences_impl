import 'package:flutter_modular/flutter_modular.dart';
import 'package:sample_project/app/services/local_storage/local_storage.dart';
import 'presenter/stores/home_store.dart';

import 'presenter/ui/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(i<ILocalStorage>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
