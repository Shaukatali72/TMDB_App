import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cast_model.g.dart';

@JsonSerializable()
class CastModel extends Equatable {
  final int id;

  @override
  List<Object> get props => [id];

  @JsonKey(name: 'original_name')
  final String castName;
  @JsonKey(name: 'profile_path')
  final String castImage;
  final String castMovieImage;
  @JsonKey(
    includeFromJson: false,
    includeToJson: false,
  )
  final String? hero;

  const CastModel({
    required this.id,
    required this.castName,
    this.castImage = '',
    this.castMovieImage = '',
    this.hero,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);
  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}
