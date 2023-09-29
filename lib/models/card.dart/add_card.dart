import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';

part 'add_card.g.dart';

@JsonSerializable()
class AddAllergenCard {
  AddAllergenCard({
    required this.name,
    @JsonKey(name: 'carriers_id') required this.carriersId,
  });

  List<String>? name;

  List<String>? carriersId;

  factory AddAllergenCard.fromJson(Map<String, dynamic> json) =>
      _$AddAllergenCardFromJson(json);

  Map<String, dynamic> toJson() => _$AddAllergenCardToJson(this);
}
