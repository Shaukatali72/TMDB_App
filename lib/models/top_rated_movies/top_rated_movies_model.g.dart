// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedMoviesModel _$TopRatedMoviesModelFromJson(Map<String, dynamic> json) =>
    TopRatedMoviesModel(
      json['id'] as int,
      topRatedImage: json['poster_path'] as String,
      movieTitle: json['title'] as String,
      movieDescription: json['overview'] as String,
      rating: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$TopRatedMoviesModelToJson(
        TopRatedMoviesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.topRatedImage,
      'title': instance.movieTitle,
      'overview': instance.movieDescription,
      'vote_average': instance.rating,
    };
