import 'package:json_annotation/json_annotation.dart';

part 'main_entity.g.dart';

@JsonSerializable()
class MainEntity {
  late double temp;
  late double pressure;
  late double feels_like;
  late int humidity;
  late double temp_min;
  late double temp_max;

  MainEntity(this.temp, this.pressure, this.feels_like,
      this.humidity, this.temp_min, this.temp_max);

  double getTemp() {
    return temp;
  }

  double getPressure() {
    return pressure;
  }

  double getFeelsLike() {
    return feels_like;
  }

  int getHumidity() {
    return humidity;
  }

  double getTempMin() {
    return temp_min;
  }

  double getTempMax() {
    return temp_max;
  }

  factory MainEntity
      .fromJson(Map<String, dynamic> json) => _$MainEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MainEntityToJson(this);
}