// import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
// import 'dart:convert';

part 'allergen_post.g.dart';




// To parse this JSON data, do
//
//     final allergenPost = allergenPostFromJson(jsonString);

@JsonSerializable()
class AllergenPost {
  AllergenPost({
    required this.pk,
    required this.name,
    required this.carriers,
  });

  int pk;
  String name;
  List<Carrier> carriers;

  factory AllergenPost.fromJson(Map<String, dynamic> json) =>
      _$AllergenPostFromJson(json);

  Map<String, dynamic> toJson() => _$AllergenPostToJson(this);
}

@JsonSerializable()
class Carrier {
  Carrier({
    required this.allergen,
    required this.id,
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



// @JsonSerializable()
// class AllergenPost {
//   List<Allergen> allergens;

//   AllergenPost({required this.allergens});

//   factory AllergenPost.fromJson(Map<String, dynamic> json) =>
//       _$AllergenPostFromJson(json);

//   Map<String, dynamic> toJson() => _$AllergenPostToJson(this);
// }

// @JsonSerializable()
// class Allergen {
//   int id;
//   String allergenName;
//   String description;
//   String miniDescription;
//   List<String> foods;

//   Allergen({
//     required this.id,
//     required this.allergenName,
//     required this.description,
//     required this.miniDescription,
//     required this.foods,
//   });

//   factory Allergen.fromJson(Map<String, dynamic> json) =>
//       _$AllergenFromJson(json);
//   Map<String, dynamic> toJson() => _$AllergenToJson(this);
// }
