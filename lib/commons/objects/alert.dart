import 'package:json_annotation/json_annotation.dart';

part 'alert.g.dart';

@JsonSerializable()
class Alert {
  num id;
  num contact ;
  String creataion_date;
  String creataion_time;
  bool is_received ;

  Alert({required this.id, required this.contact,
    required this.creataion_date, required this.creataion_time,
    required this.is_received });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json['id'],
      contact: json['contact'],
      creataion_date: json['creataion_date'] ?? '',
      creataion_time: json['creataion_time'] ?? '',
      is_received: json['is_received'] ?? false,

    );
  }
}






