// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingMoviesModel _$TrendingMoviesModelFromJson(Map<String, dynamic> json) =>
    TrendingMoviesModel(
      id: json['id'] as int,
      movieImage: json['backdrop_path'] as String,
      backgroundImage: json['poster_path'] as String,
      movieTitle: json['title'] as String,
      movieDescription: json['overview'] as String,
      rating: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$TrendingMoviesModelToJson(
        TrendingMoviesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.movieImage,
      'poster_path': instance.backgroundImage,
      'title': instance.movieTitle,
      'overview': instance.movieDescription,
      'vote_average': instance.rating,
    };
