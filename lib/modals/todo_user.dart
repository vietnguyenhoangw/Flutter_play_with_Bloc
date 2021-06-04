import 'package:json_annotation/json_annotation.dart';

part 'todo_user.g.dart';

@JsonSerializable()
class TodoUser {
  @JsonKey(name: "age")
  dynamic age;
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "__v")
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
