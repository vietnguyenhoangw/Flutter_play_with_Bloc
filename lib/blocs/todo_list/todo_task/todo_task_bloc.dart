import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo/todo_event.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo_task/todo_task.dart';
import 'package:flutter_play_with_bloc/blocs/todo_list/todo_task/todo_task_event.dart';
import 'package:flutter_play_with_bloc/modals/todo_task.dart';
import 'package:flutter_play_with_bloc/services/todo_service.dart';

class TodoTaskBloc extends Bloc<TodoTaskEvent, TodoTaskState> {
  final TodoListBloc todoBloc;

  TodoTaskBloc({required this.todoBloc}) : super(TodoTaskInitialized());

  @override
  Stream<TodoTaskState> mapEventToState(TodoTaskEvent event) async* {
    if (event is AddTaskRequest) {
      yield TodoTaskStateLoading();
      yield await _mapAddTaskRequestToState(event);
    }
  }

  Future<TodoTaskState> _mapAddTaskRequestToState(AddTaskRequest event) async {
    dynamic response =
        await TodoApi().addTodoAPI(description: event.description);
    if (response.runtimeType == TodoTask) {
      todoBloc.add(AddNewTask(todoTask: response));
      return TodoTaskStateSuccess();
    } else {
      return TodoTaskStateFailure(response);
    }
  }
}
