// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      token: json['token'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      gender: json['gender'] as String?,
      gender_str: json['gender_str'] as String?,
      dob: json['dob'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
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
