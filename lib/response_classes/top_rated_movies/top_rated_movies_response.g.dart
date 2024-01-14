// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseForTopRatedMovies _$ResponseForTopRatedMoviesFromJson(
        Map<String, dynamic> json) =>
    ResponseForTopRatedMovies(
      results: (json['results'] as List<dynamic>)
          .map((e) => TopRatedMoviesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseForTopRatedMoviesToJson(
        ResponseForTopRatedMovies instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
