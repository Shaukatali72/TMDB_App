import 'package:json_annotation/json_annotation.dart';

import '../../models/search_movies/search_movies_model.dart';

part 'search_movies_response.g.dart';

@JsonSerializable()
class ResponseForSearchMovies {
  final List<SearchMoviesModel> results;
  ResponseForSearchMovies({
    required this.results,
  });

  factory ResponseForSearchMovies.fromJson(final Map<String, dynamic> json) {
    return _$ResponseForSearchMoviesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseForSearchMoviesToJson(this);
}
