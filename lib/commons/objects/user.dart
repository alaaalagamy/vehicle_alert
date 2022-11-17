part 'user.g.dart';

class User {
  String? token;
  String? firstName;
  String? lastName;
  String? gender;
  String? gender_str;
  String? dob;
  String? country;
  String? fullname;
  String? email;
  String? username;

  User(
      {required this.token,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.gender_str,
      required this.dob,
      required this.country,
      required this.fullname,
      required this.email,
      required this.username
      });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
