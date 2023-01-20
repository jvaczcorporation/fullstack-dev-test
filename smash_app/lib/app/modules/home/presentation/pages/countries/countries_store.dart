import 'package:flutter/material.dart';
import 'package:smash_app/app/modules/home/domain/entities/country_entity.dart';

class CountriesStore {
  ValueNotifier<List<CountryEntity>?> rxCountries = ValueNotifier(null);
  List<CountryEntity>? get countries => rxCountries.value;
  set countries(List<CountryEntity>? value) => rxCountries.value = value;

  List<CountryEntity>? countriesDefault = [];

  bool hasError = false;
}
