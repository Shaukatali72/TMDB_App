// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseForCategoryMovies _$ResponseForCategoryMoviesFromJson(
        Map<String, dynamic> json) =>
    ResponseForCategoryMovies(
      results: (json['results'] as List<dynamic>)
          .map((e) => CategoryMoviesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseForCategoryMoviesToJson(
        ResponseForCategoryMovies instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
