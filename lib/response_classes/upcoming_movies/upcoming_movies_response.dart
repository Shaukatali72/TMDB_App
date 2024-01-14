import 'package:json_annotation/json_annotation.dart';

import '../../models/upcoming_movies/upcoming_movies_model.dart';

part 'upcoming_movies_response.g.dart';

@JsonSerializable()
class ResponseForUpcomingMovies {
  final List<UpcomingMoviesModel> results;
  ResponseForUpcomingMovies({
    required this.results,
  });

  factory ResponseForUpcomingMovies.fromJson(final Map<String, dynamic> json) {
    return _$ResponseForUpcomingMoviesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseForUpcomingMoviesToJson(this);
}
