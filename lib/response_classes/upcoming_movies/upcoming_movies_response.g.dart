// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseForUpcomingMovies _$ResponseForUpcomingMoviesFromJson(
        Map<String, dynamic> json) =>
    ResponseForUpcomingMovies(
      results: (json['results'] as List<dynamic>)
          .map((e) => UpcomingMoviesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseForUpcomingMoviesToJson(
        ResponseForUpcomingMovies instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
