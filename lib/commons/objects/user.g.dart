// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      token: json['token'] as String?,
      first_name: json['user']['first_name'] as String?,
      last_name: json['user']['last_name'] as String?,
      gender: json['user']['gender'] as String?,
      gender_str: json['user']['gender_str'] as String?,
      dob: json['user']['dob'] as String?,
      fullname: json['user']['fullname'] as String?,
      email: json['user']['email'] as String?,
      username: json['user']['username'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'token': instance.token,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'gender': instance.gender,
      'gender_str': instance.gender_str,
      'dob': instance.dob,
      'fullname': instance.fullname,
      'email': instance.email,
      'username': instance.username,
    };
