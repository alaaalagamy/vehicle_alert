// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: json['id'] as num,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      phone: json['phone'] as String,
      relationship: json['relationship'] as String,
      created_at: json['created_at'] as String,
      is_favourite: json['is_favourite'] as bool,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone': instance.phone,
      'relationship': instance.relationship,
      'created_at': instance.created_at,
      'is_favourite': instance.is_favourite,
    };
