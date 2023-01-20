import 'package:flutter_modular/flutter_modular.dart';
import 'package:smash_app/app/modules/home/domain/use_cases/get_countries_use_case.dart';
import 'package:smash_app/app/modules/home/presentation/pages/countries/countries_store.dart';

class CountriesController {
  final CountriesStore store;
  final GetCountriesUseCase getCountriesUseCase;

  CountriesController({
    required this.store,
    required this.getCountriesUseCase,
  });

  fetchCountries() async {
    try {
      store.hasError = false;
      store.countries = await getCountriesUseCase();
      store.countriesDefault = store.countries;
    } catch (_) {
      store.hasError = true;
      store.countries = [];
    }
  }

  navigateToCities(String idCountry) {
    Modular.to.pushNamed(
      "/cities",
      arguments: idCountry,
    );
  }

  void onChangedText(String value) {
    store.countries = store.countriesDefault!
        .where((country) => country.name.toLowerCase().startsWith(
              value.toLowerCase(),
            ))
        .toList();
  }
}
