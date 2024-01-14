import 'package:json_annotation/json_annotation.dart';

part 'recommended_movies_model.g.dart';

@JsonSerializable()
class RecommendedMoviesModel {
  final int id;
  @JsonKey(name: 'backdrop_path')
  final String movieImage;
  @JsonKey(name: 'poster_path')
  final String backgroundImage;
  @JsonKey(name: 'title')
  final String movieTitle;
  @JsonKey(name: 'overview')
  final String movieDescription;
  @JsonKey(name: 'vote_average')
  final double rating;

  RecommendedMoviesModel({
    required this.id,
    required this.movieImage,
    required this.backgroundImage,
    required this.movieTitle,
    required this.movieDescription,
    required this.rating,
  });

  factory RecommendedMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedMoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedMoviesModelToJson(this);
}
