// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseForGenres _$ResponseForGenresFromJson(Map<String, dynamic> json) =>
    ResponseForGenres(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => ChoiceChipsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseForGenresToJson(ResponseForGenres instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
