import 'package:flutter_modular/flutter_modular.dart';
import 'package:sample_project/app/services/local_storage/impl/shared_preferences_impl.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SharedPreferencesImpl()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];
}
