import 'package:json_annotation/json_annotation.dart';

import '../../models/top_rated_movies/top_rated_movies_model.dart';

part 'top_rated_movies_response.g.dart';

@JsonSerializable()
class ResponseForTopRatedMovies {
  final List<TopRatedMoviesModel> results;
  const ResponseForTopRatedMovies({
    required this.results,
  });

  factory ResponseForTopRatedMovies.fromJson(final Map<String, dynamic> json) {
    return _$ResponseForTopRatedMoviesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseForTopRatedMoviesToJson(this);
}
