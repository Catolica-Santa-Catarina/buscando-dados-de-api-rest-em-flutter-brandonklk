import 'package:json_annotation/json_annotation.dart';

part 'weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {
  late int id;
  late String main;
  late String description;
  late String icon;

  WeatherEntity(this.id, this.main, this.description, this.icon);

  int getId() {
    return id;
  }

  String getMain() {
    return main;
  }

  String getDescription() {
    return description;
  }

  String getIcon() {
    return icon;
  }

  factory WeatherEntity
      .fromJson(Map<String, dynamic> json) => _$WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntityToJson(this);
}