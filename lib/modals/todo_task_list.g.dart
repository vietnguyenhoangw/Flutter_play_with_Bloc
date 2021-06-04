// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_task_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoTaskList _$TodoTaskListFromJson(Map<String, dynamic> json) {
  return TodoTaskList(
    todoTaskList: (json['data'] as List<dynamic>)
        .map((e) => TodoTask.fromJson(e as Map<String, dynamic>))
        .toList(),
    count: json['count'],
  );
}

Map<String, dynamic> _$TodoTaskListToJson(TodoTaskList instance) =>
    <String, dynamic>{
      'data': instance.todoTaskList,
      'count': instance.count,
    };
