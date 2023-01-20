import 'package:smash_app/app/modules/home/domain/entities/city_entity.dart';
import 'package:smash_app/app/modules/home/domain/repositories/firebase_repository.dart';

abstract class GetCitiesUseCase {
  Future<List<CityEntity>> call({required idCountry});
}

class GetCitiesUseCaseImpl implements GetCitiesUseCase {
  final FirebaseRepository repository;

  GetCitiesUseCaseImpl({
    required this.repository,
  });

  @override
  Future<List<CityEntity>> call({required idCountry}) async {
    return await repository.getCities(
      idCountry: idCountry,
    );
  }
}
