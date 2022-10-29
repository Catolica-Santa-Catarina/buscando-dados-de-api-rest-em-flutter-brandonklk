import 'package:json_annotation/json_annotation.dart';

part 'location_entity.g.dart';

@JsonSerializable()
class LocationEntity {
  late double lat;
  late double lon;

  LocationEntity(this.lat, this.lon);

  double getLatitude() {
    return lat;
  }

  double getLongitude() {
    return lon;
  }

  factory LocationEntity
      .fromJson(Map<String, dynamic> json) => _$LocationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocationEntityToJson(this);
}