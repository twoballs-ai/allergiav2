// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergen_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllergenPost _$AllergenPostFromJson(Map<String, dynamic> json) => AllergenPost(
      pk: json['pk'] as int,
      name: json['name'] as String,
      carriers: (json['carriers'] as List<dynamic>)
          .map((e) => Carrier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllergenPostToJson(AllergenPost instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'name': instance.name,
      'carriers': instance.carriers,
    };

Carrier _$CarrierFromJson(Map<String, dynamic> json) => Carrier(
      allergen: Allergen.fromJson(json['allergen'] as Map<String, dynamic>),
      id: json['id'] as int,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CarrierToJson(Carrier instance) => <String, dynamic>{
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
