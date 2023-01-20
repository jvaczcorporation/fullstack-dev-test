import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smash_app/app/commons/constants.dart';
import 'package:smash_app/app/modules/home/domain/entities/city_entity.dart';
import 'package:smash_app/app/modules/home/domain/entities/country_entity.dart';
import 'package:smash_app/app/modules/home/domain/repositories/firebase_repository.dart';
import 'package:smash_app/app/modules/home/infra/models/city_model.dart';
import 'package:smash_app/app/modules/home/infra/models/country_model.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseFirestore firestore;

  FirebaseRepositoryImpl({required this.firestore});

  @override
  Future<List<CountryEntity>> getCountries() async {
    final result =
        await firestore.collection(kCollectionCountries).orderBy('name').get();

    final mapWithId = result.docs.map((doc) {
      final data = doc.data();
      data.putIfAbsent('id', () => doc.id);

      return data;
    });

    final listCountryEntity = mapWithId
        .map((country) => CountryModel.fromMap(country).toEntity())
        .toList();

    return listCountryEntity;
  }

  @override
  Future<List<CityEntity>> getCities({required String idCountry}) async {
    final docRef = firestore.collection(kCollectionCountries).doc(idCountry);

    final result =
        await docRef.collection(kCollectionCities).orderBy('name').get();

    final mapWithId = result.docs.map((doc) {
      final data = doc.data();
      data.putIfAbsent('id', () => doc.id);

      return data;
    });

    final listCityEntity =
        mapWithId.map((city) => CityModel.fromMap(city).toEntity()).toList();

    return listCityEntity;
  }
}
