import 'package:json_annotation/json_annotation.dart';

part 'choice_chips_model.g.dart';

@JsonSerializable()
class ChoiceChipsModel {
  final int id;
  @JsonKey(name: 'name')
  final String chipsName;

  const ChoiceChipsModel({
    required this.id,
    required this.chipsName,
  });

  factory ChoiceChipsModel.fromJson(Map<String, dynamic> json) =>
      _$ChoiceChipsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChoiceChipsModelToJson(this);
}
