import 'package:smash_app/app/modules/home/domain/entities/city_entity.dart';

class CityModel {
  final String id;
  final String name;
  final String state;

  CityModel({
    required this.id,
    required this.name,
    required this.state,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map["id"],
      name: map["name"],
      state: map["state"],
    );
  }

  CityEntity toEntity() {
    return CityEntity(
      id: id,
      name: name,
      state: state,
    );
  }
}
