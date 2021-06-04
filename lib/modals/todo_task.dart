import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_play_with_bloc/modals/todo_user.dart';

part 'todo_task.g.dart';

@JsonSerializable()
class TodoTask {
  @JsonKey(name: "completed")
  bool completed;
  @JsonKey(name: "_id")
  String id;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "owner")
  String owner;
  @JsonKey(name: "createdAt")
  String createdAt;
  @JsonKey(name: "updatedAt")
  String updatedAt;
  @JsonKey(name: "__v")
  dynamic v;

  TodoTask({
    required this.completed,
    required this.id,
    required this.description,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory TodoTask.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskFromJson(json);
  Map<String, dynamic> toJson() => _$TodoTaskToJson(this);
}
