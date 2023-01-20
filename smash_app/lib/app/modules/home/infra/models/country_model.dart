import 'package:smash_app/app/modules/home/domain/entities/country_entity.dart';

class CountryModel {
  final String id;
  final String name;

  CountryModel({
    required this.id,
    required this.name,
  });

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map["id"],
      name: map["name"],
    );
  }

  CountryEntity toEntity() {
    return CountryEntity(
      id: id,
      name: name,
    );
  }
}
