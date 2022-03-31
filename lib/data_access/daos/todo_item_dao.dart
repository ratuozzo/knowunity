import 'dart:convert';

import 'package:knowunity/model/todo_item.dart';
import 'package:knowunity/network/api_helper.dart';

class TodoItemDao {
  final String url = "/todos";

  Future<List<TodoItem>> getAll() async {
    ApiHelper apiHelper = ApiHelper();
    List<TodoItem> output = [];
    var response = await apiHelper.get(url);
    var responseJson = json.decode(response.body.toString());
    for (Map<String, dynamic> item in responseJson) {
      output.add(TodoItem.fromJson(item));
    }
    return output;
  }

  Future<TodoItem> create(TodoItem item) async {
    ApiHelper apiHelper = ApiHelper();
    var response = await apiHelper.post(url, item.toJson());
    var responseJson = json.decode(response.body.toString());
    TodoItem output = TodoItem.fromJson(responseJson);
    return output;
  }
}
