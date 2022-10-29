import 'package:json_annotation/json_annotation.dart';

import 'package:tempo_template/entity/clouds_entity.dart';
import 'package:tempo_template/entity/location_entity.dart';
import 'package:tempo_template/entity/main_entity.dart';
import 'package:tempo_template/entity/sys_entity.dart';
import 'package:tempo_template/entity/weather_entity.dart';
import 'package:tempo_template/entity/wind_entity.dart';

part 'coordinates_entity.g.dart';

@JsonSerializable()
class CoordinatesEntity {
  late LocationEntity coord;
  late List<WeatherEntity> weather;
  late MainEntity main;
  late WindEntity wind;
  late CloudsEntity clouds;
  late SysEntity sys;
  late String base;
  late int dt;
  late int id;
  late String name;
  late int cod;
  late int visibility;
  late int timezone;

  CoordinatesEntity(
      this.coord,
      this.weather,
      this.main,
      this.wind,
      this.clouds,
      this.sys,
      this.base,
      this.dt,
      this.id,
      this.name,
      this.cod,
      this.visibility,
      this.timezone);

  LocationEntity getCoord(){
    return coord;
  }

  List<WeatherEntity> getWeather() {
    return weather;
  }

  MainEntity getMain() {
    return main;
  }

  WindEntity getWind() {
    return wind;
  }

  CloudsEntity getClouds(){
    return clouds;
  }

  SysEntity getSys(){
    return sys;
  }

  String getBase(){
    return base;
  }

  int getDt(){
    return dt;
  }

  int getId(){
    return id;
  }

  String getName(){
    return name;
  }

  int getCod(){
    return cod;
  }

  factory CoordinatesEntity
      .fromJson(Map<String, dynamic> json) => _$CoordinatesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesEntityToJson(this);


}