// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastModel _$CastModelFromJson(Map<String, dynamic> json) => CastModel(
      id: json['id'] as int,
      castName: json['original_name'] as String,
      castImage: json['profile_path'] as String? ?? '',
      castMovieImage: json['castMovieImage'] as String? ?? '',
    );

Map<String, dynamic> _$CastModelToJson(CastModel instance) => <String, dynamic>{
      'id': instance.id,
      'original_name': instance.castName,
      'profile_path': instance.castImage,
      'castMovieImage': instance.castMovieImage,
    };
