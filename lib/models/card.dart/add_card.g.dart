// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAllergenCard _$AddAllergenCardFromJson(Map<String, dynamic> json) =>
    AddAllergenCard(
      name: (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
      carriersId: (json['carriersId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AddAllergenCardToJson(AddAllergenCard instance) =>
    <String, dynamic>{
      'name': instance.name,
      'carriersId': instance.carriersId,
    };
