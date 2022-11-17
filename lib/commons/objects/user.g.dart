part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) => User(
  token: json['token'] as String,
  country: json['user']['country'] != null ? json['user']['country'] as String : '',
  email: json['user']['email'] != null ? json['user']['email'] as String : '',
  username: json['user']['username'] != null ? json['user']['username'] as String : '',
  dob: json['user']['dob'] != null ? json['user']['dob'] as String : '',
  firstName: json['user']['first_name'] != null ? json['user']['first_name'] as String : '',
  lastName: json['user']['last_name'] != null ? json['user']['last_name'] as String : '',
  fullname: json['user']['fullname'] != null ? json['user']['fullname'] as String : '',
  gender: json['user']['gender'] != null ? json['user']['gender'] as String : '',
  gender_str: json['user']['gender_str'] != null ? json['user']['gender_str'] as String : '',);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'token': instance.token,
  'user': {
    'country': instance.country,
    'email': instance.email,
    'dob': instance.dob,
    'first_name': instance.firstName,
    'last_name': instance.lastName,
    'fullname': instance.fullname,
    'gender': instance.gender,
    'gender_str': instance.gender_str,
    'username': instance.username,
  }
};