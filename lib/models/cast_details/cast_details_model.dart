import 'package:json_annotation/json_annotation.dart';

part 'cast_details_model.g.dart';

@JsonSerializable()
class CastDetailsModel {
  @JsonKey(name: 'biography')
  final String castBio;
  @JsonKey(name: 'known_for_department')
  final String department;

  CastDetailsModel({
    required this.castBio,
    required this.department,
  });

  factory CastDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CastDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CastDetailsModelToJson(this);
}
