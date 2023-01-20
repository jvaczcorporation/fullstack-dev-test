import 'package:smash_app/app/modules/home/domain/use_cases/get_cities_use_case.dart';
import 'package:smash_app/app/modules/home/presentation/pages/cities/cities_store.dart';

class CitiesController {
  final CitiesStore store;
  final GetCitiesUseCase getCitiesUseCase;

  CitiesController({
    required this.store,
    required this.getCitiesUseCase,
  });

  fetchCities(String idCountry) async {
    try {
      store.hasError = false;
      store.cities = await getCitiesUseCase(
        idCountry: idCountry,
      );
      store.citiesDefault = store.cities;
    } catch (_) {
      store.hasError = true;
      store.cities = [];
    }
  }

  void onChangedText(String value) {
    store.cities = store.citiesDefault!
        .where((country) => country.name.toLowerCase().startsWith(
              value.toLowerCase(),
            ))
        .toList();
  }
}
