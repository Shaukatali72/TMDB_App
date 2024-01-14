// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMoviesModel _$SearchMoviesModelFromJson(Map<String, dynamic> json) =>
    SearchMoviesModel(
      json['id'] as int,
      searchImage: json['poster_path'] as String? ?? '',
      movieTitle: json['title'] as String,
      movieDescription: json['overview'] as String,
      rating: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$SearchMoviesModelToJson(SearchMoviesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.searchImage,
      'title': instance.movieTitle,
      'overview': instance.movieDescription,
      'vote_average': instance.rating,
    };
