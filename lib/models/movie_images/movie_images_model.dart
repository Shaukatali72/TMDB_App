import 'package:json_annotation/json_annotation.dart';

part 'movie_images_model.g.dart';

@JsonSerializable()
class MovieImagesModel {
  @JsonKey(name: 'file_path')
  final String movieImage;

  MovieImagesModel({
    required this.movieImage,
  });

  factory MovieImagesModel.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieImagesModelToJson(this);
}
