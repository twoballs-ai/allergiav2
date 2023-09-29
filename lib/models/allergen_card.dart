import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';

part 'allergen_card.g.dart';

@JsonSerializable()
class AllergenCard {
  AllergenCard({
    required this.pk,
    required this.name,
    required this.carriers,
  });

  int pk;
  String name;
  List<Carrier?> carriers;

  factory AllergenCard.fromJson(Map<String, dynamic> json) =>
      _$AllergenCardFromJson(json);

  Map<String, dynamic> toJson() => _$AllergenCardToJson(this);
}

@JsonSerializable()
class Carrier {
  Carrier({
    required this.id,
    required this.allergen,
    required this.category,
    required this.name,
    required this.image,
    required this.description,
  });

  int id;
  Allergen allergen;
  Category category;
  String name;
  String image;
  String description;

  factory Carrier.fromJson(Map<String, dynamic> json) =>
      _$CarrierFromJson(json);

  Map<String, dynamic> toJson() => _$CarrierToJson(this);
}

@JsonSerializable()
class Allergen {
  Allergen({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory Allergen.fromJson(Map<String, dynamic> json) =>
      _$AllergenFromJson(json);

  Map<String, dynamic> toJson() => _$AllergenToJson(this);
}

@JsonSerializable()
class Category {
  Category({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
