import 'package:json_annotation/json_annotation.dart';

import '/models/trending_movies/trending_movies_model.dart';

part 'trending_movies_response.g.dart';

@JsonSerializable()
class ResponseForTrendingMovies {
  final List<TrendingMoviesModel> results;
  const ResponseForTrendingMovies({
    required this.results,
  });

  factory ResponseForTrendingMovies.fromJson(final Map<String, dynamic> json) {
    return _$ResponseForTrendingMoviesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseForTrendingMoviesToJson(this);
}
