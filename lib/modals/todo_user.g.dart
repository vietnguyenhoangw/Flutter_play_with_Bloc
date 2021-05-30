// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoUser _$TodoUserFromJson(Map<String, dynamic> json) {
  return TodoUser(
    age: json['age'] as dynamic,
    id: json['_id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    v: json['__v'] as dynamic,
  );
}

Map<String, dynamic> _$TodoUserToJson(TodoUser instance) => <String, dynamic>{
      'age': instance.age,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
