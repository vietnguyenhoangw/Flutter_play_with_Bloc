import 'package:json_annotation/json_annotation.dart';

part 'todo_user.g.dart';

@JsonSerializable()
class TodoUser {
  dynamic age;
  String id;
  String name;
  String email;
  String createdAt;
  String updatedAt;
  dynamic v;

  TodoUser({
    required this.age,
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory TodoUser.fromJson(Map<String, dynamic> json) =>
      _$TodoUserFromJson(json);
  Map<String, dynamic> toJson() => _$TodoUserToJson(this);
}
