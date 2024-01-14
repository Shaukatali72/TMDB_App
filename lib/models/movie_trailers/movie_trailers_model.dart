import 'package:json_annotation/json_annotation.dart';

part 'movie_trailers_model.g.dart';

@JsonSerializable()
class MovieTrailersModel {
  @JsonKey(name: 'key')
  final String movieTrailer;

  MovieTrailersModel({
    required this.movieTrailer,
  });

  factory MovieTrailersModel.fromJson(Map<String, dynamic> json) =>
      _$MovieTrailersModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieTrailersModelToJson(this);
}
