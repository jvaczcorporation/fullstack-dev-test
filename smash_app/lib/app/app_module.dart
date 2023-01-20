import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_app/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => FirebaseFirestore.instance,
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: HomeModule(),
        ),
      ];
}
