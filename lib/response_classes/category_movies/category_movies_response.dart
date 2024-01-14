import 'package:json_annotation/json_annotation.dart';

import '../../models/category_movies/category_movies_model.dart';

part 'category_movies_response.g.dart';

@JsonSerializable()
class ResponseForCategoryMovies {
  final List<CategoryMoviesModel> results;
  const ResponseForCategoryMovies({
    required this.results,
  });

  factory ResponseForCategoryMovies.fromJson(final Map<String, dynamic> json) {
    return _$ResponseForCategoryMoviesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseForCategoryMoviesToJson(this);
}
