// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastDetailsModel _$CastDetailsModelFromJson(Map<String, dynamic> json) =>
    CastDetailsModel(
      castBio: json['biography'] as String,
      department: json['known_for_department'] as String,
    );

Map<String, dynamic> _$CastDetailsModelToJson(CastDetailsModel instance) =>
    <String, dynamic>{
      'biography': instance.castBio,
      'known_for_department': instance.department,
    };
