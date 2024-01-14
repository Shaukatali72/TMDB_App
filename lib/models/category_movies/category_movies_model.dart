import 'package:json_annotation/json_annotation.dart';

part 'category_movies_model.g.dart';

@JsonSerializable()
class CategoryMoviesModel {
  final int id;
  @JsonKey(name: 'backdrop_path')
  final String frontImage;
  @JsonKey(name: 'poster_path')
  final String backgroundImage;
  @JsonKey(name: 'title')
  final String movieTitle;
  @JsonKey(name: 'overview')
  final String movieDescription;
  @JsonKey(name: 'vote_average')
  final double rating;

  const CategoryMoviesModel(
    this.id, {
    required this.frontImage,
    required this.backgroundImage,
    required this.movieTitle,
    required this.movieDescription,
    required this.rating,
  });

  factory CategoryMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryMoviesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryMoviesModelToJson(this);
}
