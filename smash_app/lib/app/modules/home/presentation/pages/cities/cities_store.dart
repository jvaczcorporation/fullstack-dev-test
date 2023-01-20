import 'package:flutter/material.dart';
import 'package:smash_app/app/modules/home/domain/entities/city_entity.dart';

class CitiesStore {
  ValueNotifier<List<CityEntity>?> rxCities = ValueNotifier(null);
  List<CityEntity>? get cities => rxCities.value;
  set cities(List<CityEntity>? value) => rxCities.value = value;

  List<CityEntity>? citiesDefault = [];

  bool hasError = false;
}
