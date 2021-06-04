import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_play_with_bloc/modals/todo_user.dart';

part 'todo_user_rp.g.dart';

@JsonSerializable()
class TodoUserRP {
  @JsonKey(name: "user")
  TodoUser todoUser;
  @JsonKey(name: "token")
  dynamic token;

  TodoUserRP({
    required this.todoUser,
    required this.token,
  });

  factory TodoUserRP.fromJson(Map<String, dynamic> json) =>
      _$TodoUserRPFromJson(json);
  Map<String, dynamic> toJson() => _$TodoUserRPToJson(this);
}
