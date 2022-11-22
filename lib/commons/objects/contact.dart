import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()

class Contact {
  num id;
  String first_name;
  String last_name;
  String phone;
  String relationship;
  String created_at ;
  bool is_favourite ;

  Contact({required this.id, required this.first_name,
    required this.last_name, required this.phone,
    required this.relationship , required this.created_at,
    required this.is_favourite });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
        id: json['id'],
        first_name: json['first_name'] ?? '',
        last_name: json['last_name'] ?? '',
        phone: json['phone'] ?? '',
        relationship: json['relationship'] ?? '',
        created_at: json['created_at'] ?? '',
        is_favourite: json['is_favourite'] ?? false,

    );
  }
}
