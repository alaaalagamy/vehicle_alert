// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alert _$AlertFromJson(Map<String, dynamic> json) => Alert(
      id: json['id'] as num,
      contact: json['contact'] as num,
      creataion_date: json['creataion_date'] as String,
      creataion_time: json['creataion_time'] as String,
      is_received: json['is_received'] as bool,
    );

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
      'id': instance.id,
      'contact': instance.contact,
      'creataion_date': instance.creataion_date,
      'creataion_time': instance.creataion_time,
      'is_received': instance.is_received,
    };
