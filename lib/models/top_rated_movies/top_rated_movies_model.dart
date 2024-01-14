import 'package:json_annotation/json_annotation.dart';

part 'top_rated_movies_model.g.dart';

@JsonSerializable()
class TopRatedMoviesModel {
  final int id;
  @JsonKey(name: 'poster_path')
  final String topRatedImage;
  @JsonKey(name: 'title')
  final String movieTitle;
  @JsonKey(name: 'overview')
  final String movieDescription;
  @JsonKey(name: 'vote_average')
  final double rating;

  const TopRatedMoviesModel(
    this.id, {
    required this.topRatedImage,
    required this.movieTitle,
    required this.movieDescription,
    required this.rating,
  });

  factory TopRatedMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$TopRatedMoviesModelFromJson(json);
  Map<String, dynamic> toJson() => _$TopRatedMoviesModelToJson(this);
}
