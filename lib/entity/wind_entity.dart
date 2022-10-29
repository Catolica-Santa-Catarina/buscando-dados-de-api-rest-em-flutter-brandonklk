import 'package:json_annotation/json_annotation.dart';

part 'wind_entity.g.dart';

@JsonSerializable()
class WindEntity {
  late double speed;
  late int deg;

  WindEntity(this.speed, this.deg);

  double getSpeed() {
    return speed;
  }

  int getDeg() {
    return deg;
  }

  factory WindEntity
      .fromJson(Map<String, dynamic> json) => _$WindEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WindEntityToJson(this);
}