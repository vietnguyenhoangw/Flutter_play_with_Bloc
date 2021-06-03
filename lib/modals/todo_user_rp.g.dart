// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_user_rp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoUserRP _$TodoUserRPFromJson(Map<String, dynamic> json) {
  return TodoUserRP(
    todoUser: TodoUser.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as dynamic,
  );
}

Map<String, dynamic> _$TodoUserRPToJson(TodoUserRP instance) =>
    <String, dynamic>{
      'user': instance.todoUser,
      'token': instance.token,
    };
