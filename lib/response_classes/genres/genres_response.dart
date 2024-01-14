import 'package:json_annotation/json_annotation.dart';

import '../../models/choice_chips/choice_chips_model.dart';

part 'genres_response.g.dart';

@JsonSerializable()
class ResponseForGenres {
  final List<ChoiceChipsModel> genres;
  const ResponseForGenres({
    required this.genres,
  });

  factory ResponseForGenres.fromJson(final Map<String, dynamic> json) {
    return _$ResponseForGenresFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseForGenresToJson(this);
}
