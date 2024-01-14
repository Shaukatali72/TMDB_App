// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseForSearchMovies _$ResponseForSearchMoviesFromJson(
        Map<String, dynamic> json) =>
    ResponseForSearchMovies(
      results: (json['results'] as List<dynamic>)
          .map((e) => SearchMoviesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseForSearchMoviesToJson(
        ResponseForSearchMovies instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
