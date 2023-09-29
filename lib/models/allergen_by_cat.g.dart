// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergen_by_cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllergenByCat _$AllergenByCatFromJson(Map<String, dynamic> json) =>
    AllergenByCat(
      id: json['id'] as int,
      allergen: Allergen.fromJson(json['allergen'] as Map<String, dynamic>),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$AllergenByCatToJson(AllergenByCat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'allergen': instance.allergen,
      'category': instance.category,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
    };

Allergen _$AllergenFromJson(Map<String, dynamic> json) => Allergen(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$AllergenToJson(Allergen instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
