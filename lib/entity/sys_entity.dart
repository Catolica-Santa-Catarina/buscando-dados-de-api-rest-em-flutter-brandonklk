import 'package:json_annotation/json_annotation.dart';

part 'sys_entity.g.dart';

@JsonSerializable()
class SysEntity {
  late int type;
  late int id;
  late String country;
  late int sunrise;
  late int sunset;

  SysEntity(this.type, this.id, this.country, this.sunrise, this.sunset);

  int getType() {
    return type;
  }

  int getId() {
    return id;
  }

  String getCountry() {
    return country;
  }

  int getSunrise() {
    return sunrise;
  }

  int getSunset() {
    return sunset;
  }

  factory SysEntity
      .fromJson(Map<String, dynamic> json) => _$SysEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SysEntityToJson(this);
}