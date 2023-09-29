import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';

part 'allergen_by_cat.g.dart';

@JsonSerializable()
class AllergenByCat {
  AllergenByCat({
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

  factory AllergenByCat.fromJson(Map<String, dynamic> json) =>
      _$AllergenByCatFromJson(json);

  Map<String, dynamic> toJson() => _$AllergenByCatToJson(this);
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
