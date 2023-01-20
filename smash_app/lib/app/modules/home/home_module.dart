import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_app/app/modules/home/domain/use_cases/get_cities_use_case.dart';
import 'package:smash_app/app/modules/home/domain/use_cases/get_countries_use_case.dart';
import 'package:smash_app/app/modules/home/infra/repositories/firebase_repository_impl.dart';
import 'package:smash_app/app/modules/home/presentation/pages/cities/cities_controller.dart';
import 'package:smash_app/app/modules/home/presentation/pages/cities/cities_page.dart';
import 'package:smash_app/app/modules/home/presentation/pages/cities/cities_store.dart';
import 'package:smash_app/app/modules/home/presentation/pages/countries/countries_controller.dart';
import 'package:smash_app/app/modules/home/presentation/pages/countries/countries_page.dart';
import 'package:smash_app/app/modules/home/presentation/pages/countries/countries_store.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => FirebaseRepositoryImpl(
            firestore: i(),
          ),
        ),
        Bind.factory(
          (i) => GetCountriesUseCaseImpl(
            repository: i(),
          ),
        ),
        Bind.factory(
          (i) => GetCitiesUseCaseImpl(
            repository: i(),
          ),
        ),
        Bind.factory((i) => CountriesStore()),
        Bind.factory(
          (i) => CountriesController(
            getCountriesUseCase: i(),
            store: i(),
          ),
        ),
        Bind.factory((i) => CitiesStore()),
        Bind.factory(
          (i) => CitiesController(
            getCitiesUseCase: i(),
            store: i(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const CountriesPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          '/cities',
          child: (context, args) => CitiesPage(
            idCountry: args.data,
          ),
          transition: TransitionType.noTransition,
        ),
      ];
}
