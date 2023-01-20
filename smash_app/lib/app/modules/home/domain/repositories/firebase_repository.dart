import 'package:smash_app/app/modules/home/domain/entities/city_entity.dart';
import 'package:smash_app/app/modules/home/domain/entities/country_entity.dart';

abstract class FirebaseRepository {
  Future<List<CountryEntity>> getCountries();

  Future<List<CityEntity>> getCities({
    required String idCountry,
  });
}
