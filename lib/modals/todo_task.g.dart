// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoTask _$TodoTaskFromJson(Map<String, dynamic> json) {
  return TodoTask(
    completed: json['completed'] as bool,
    id: json['_id'] as String,
    description: json['description'] as String,
    owner: json['owner'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    v: json['__v'],
  );
}

Map<String, dynamic> _$TodoTaskToJson(TodoTask instance) => <String, dynamic>{
      'completed': instance.completed,
      '_id': instance.id,
      'description': instance.description,
      'owner': instance.owner,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
