import 'package:json_annotation/json_annotation.dart';

part 'trending_movies_model.g.dart';

@JsonSerializable()
class TrendingMoviesModel {
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

  const TrendingMoviesModel({
    required this.id,
    required this.movieImage,
    required this.backgroundImage,
    required this.movieTitle,
    required this.movieDescription,
    required this.rating,
  });

  factory TrendingMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$TrendingMoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingMoviesModelToJson(this);
}
