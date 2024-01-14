import 'package:json_annotation/json_annotation.dart';

part 'search_movies_model.g.dart';

@JsonSerializable()
class SearchMoviesModel {
  final int id;
  @JsonKey(name: 'poster_path')
  final String searchImage;
  @JsonKey(name: 'title')
  final String movieTitle;
  @JsonKey(name: 'overview')
  final String movieDescription;
  @JsonKey(name: 'vote_average')
  final double rating;

  SearchMoviesModel(
    this.id, {
    this.searchImage = '',
    required this.movieTitle,
    required this.movieDescription,
    required this.rating,
  });

  factory SearchMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$SearchMoviesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchMoviesModelToJson(this);
}
