import 'package:flutter_play_with_bloc/modals/todo_task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_task_list.g.dart';

@JsonSerializable()
class TodoTaskList {
  @JsonKey(name: "data")
  List<TodoTask> todoTaskList;
  @JsonKey(name: "count")
  dynamic count;

  TodoTaskList({
    required this.todoTaskList,
    required this.count,
  });

  factory TodoTaskList.fromJson(Map<String, dynamic> json) =>
      _$TodoTaskListFromJson(json);
  Map<String, dynamic> toJson() => _$TodoTaskListToJson(this);
}
