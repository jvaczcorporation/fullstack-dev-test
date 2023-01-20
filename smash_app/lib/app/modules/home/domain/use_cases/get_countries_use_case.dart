import 'package:smash_app/app/modules/home/domain/entities/country_entity.dart';
import 'package:smash_app/app/modules/home/domain/repositories/firebase_repository.dart';

abstract class GetCountriesUseCase {
  Future<List<CountryEntity>> call();
}

class GetCountriesUseCaseImpl implements GetCountriesUseCase {
  final FirebaseRepository repository;

  GetCountriesUseCaseImpl({
    required this.repository,
  });

  @override
  Future<List<CountryEntity>> call() async {
    return await repository.getCountries();
  }
}
