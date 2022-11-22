import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  // String? token;
  String? first_name;
  String? last_name;
  String? gender;
  String? gender_str;
  String? dob;
  String? fullname;
  String? email;
  String? username;

  User(
      {
        // this.token,
        this.first_name,
        this.last_name,
        this.gender,
        this.gender_str,
        this.dob,
        this.fullname,
        this.email,
        this.username
      });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
