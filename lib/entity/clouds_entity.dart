import 'package:json_annotation/json_annotation.dart';

part 'clouds_entity.g.dart';

@JsonSerializable()
class CloudsEntity {
  late int all;

  CloudsEntity(this.all);

  int getAll() {
    return all;
  }

  factory CloudsEntity
      .fromJson(Map<String, dynamic> json) => _$CloudsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsEntityToJson(this);
}