// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseForTrendingMovies _$ResponseForTrendingMoviesFromJson(
        Map<String, dynamic> json) =>
    ResponseForTrendingMovies(
      results: (json['results'] as List<dynamic>)
          .map((e) => TrendingMoviesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseForTrendingMoviesToJson(
        ResponseForTrendingMovies instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
