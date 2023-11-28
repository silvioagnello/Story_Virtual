import 'dart:convert';
import 'package:eggs/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const nameKey = 'TodoListKeys';

class TodoRepository {
  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(nameKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos) {
    final jsonString = json.encode(todos);
    sharedPreferences.setString(nameKey, jsonString);
  }
}
