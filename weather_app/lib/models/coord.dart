import 'package:json_annotation/json_annotation.dart';
part 'coord.g.dart';

@JsonSerializable()
class Coord {
  double? lon;
  double? lat;
  Coord({this.lon, this.lat});
  factory Coord.fromJson(Map json) => _$CoordFromJson(json);
  Map toJson() => _$CoordToJson(this);
}
