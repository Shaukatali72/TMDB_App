// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryMoviesModel _$CategoryMoviesModelFromJson(Map<String, dynamic> json) =>
    CategoryMoviesModel(
      json['id'] as int,
      frontImage: json['backdrop_path'] as String,
      backgroundImage: json['poster_path'] as String,
      movieTitle: json['title'] as String,
      movieDescription: json['overview'] as String,
      rating: (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$CategoryMoviesModelToJson(
        CategoryMoviesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.frontImage,
      'poster_path': instance.backgroundImage,
      'title': instance.movieTitle,
      'overview': instance.movieDescription,
      'vote_average': instance.rating,
    };
