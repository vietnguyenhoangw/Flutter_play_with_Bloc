import 'package:flutter_play_with_bloc/contants/error_list.dart';
import 'package:flutter_play_with_bloc/modals/todo_task.dart';
import 'package:flutter_play_with_bloc/modals/todo_task_list.dart';
import 'package:flutter_play_with_bloc/modals/todo_user_rp.dart';
import 'package:flutter_play_with_bloc/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final baseUrl = "https://api-nodejs-todolist.herokuapp.com";

class TodoApi {
  Future<dynamic> todoLoginAPI(
      {Function(String)? onError,
      required String username,
      required String password}) async {
    try {
      String endpoint = baseUrl + "/user/login";
      http.Response response = await http.post(Uri.parse(endpoint),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          },
          body: jsonEncode({
            "email": "muh.nurali43@gmail.com",
            "password": "12345678",
            // "email": username.toString(),
            // "password": password.toString()
          }));
      dynamic bodyResponse = json.decode(response.body);
      if (bodyResponse != TodoErrorList.unable_to_login) {
        TodoUserRP allUserData = TodoUserRP.fromJson(bodyResponse);
        return allUserData;
      } else {
        // return errorr unable_to_login
        String error = response.body;
        return error.substring(1, error.length - 1);
      }
    } catch (e) {
      return ("Something get wrong! Status code ${e.toString()}");
    }
  }

  Future<dynamic> todoListFetchedAPI(
      {Function(String)? onError,
      required int limit,
      required int skip}) async {
    try {
      String userToken =
          await SpUtil().getStringFromLocal(SpUtilKey.userToken.toString());
      String endpoint = baseUrl + "/task?limit=$limit&skip=$skip";
      http.Response response = await http.get(
        Uri.parse(endpoint),
        headers: {
          'Authorization': 'Bearer $userToken',
          "Accept": "application/json",
          "content-type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        dynamic bodyResponse = json.decode(response.body);
        TodoTaskList todoTaskList = TodoTaskList.fromJson(bodyResponse);
        return todoTaskList;
      } else {
        return ("Something get wrong! Status code ${response.statusCode}");
      }
    } catch (e) {
      return ("Something get wrong! Status code ${e.toString()}");
    }
  }

  Future<dynamic> addTodoAPI(
      {Function(String)? onError, required String description}) async {
    try {
      String userToken =
          await SpUtil().getStringFromLocal(SpUtilKey.userToken.toString());
      String endpoint = baseUrl + "/task";
      http.Response response = await http.post(Uri.parse(endpoint),
          headers: {
            'Authorization': 'Bearer $userToken',
            "Accept": "application/json",
            "content-type": "application/json",
          },
          body: jsonEncode({
            "description": description,
          }));
      if (response.statusCode == 201) {
        dynamic bodyResponse = json.decode(response.body);
        bool isSuccess = bodyResponse['success'];
        if (isSuccess) {
          TodoTask todoTask = TodoTask.fromJson(bodyResponse['data']);
          return todoTask;
        } else {
          return ("Something get wrong!");
        }
      } else {
        return ("Something get wrong! Status code ${response.statusCode}");
      }
    } catch (e) {
      return ("Something get wrong! Status code ${e.toString()}");
    }
  }

  Future<dynamic> deleteTodoAPI(
      {Function(String)? onError, required TodoTask todoTask}) async {
    try {
      String userToken =
          await SpUtil().getStringFromLocal(SpUtilKey.userToken.toString());
      String endpoint = baseUrl + "/task/${todoTask.id.toString()}";
      http.Response response = await http.delete(Uri.parse(endpoint), headers: {
        'Authorization': 'Bearer $userToken',
        "Accept": "application/json",
        "content-type": "application/json",
      });
      if (response.statusCode == 200) {
        dynamic bodyResponse = json.decode(response.body);
        bool isSuccess = bodyResponse['success'];
        if (isSuccess) {
          return isSuccess;
        } else {
          return ("Something get wrong!");
        }
      } else {
        return ("Something get wrong! Status code ${response.statusCode}");
      }
    } catch (e) {
      return ("Something get wrong! Status code ${e.toString()}");
    }
  }
}
