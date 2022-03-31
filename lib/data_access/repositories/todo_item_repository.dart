import 'package:knowunity/data_access/daos/todo_item_dao.dart';
import 'package:knowunity/model/todo_item.dart';

class TodoItemRepository {
  final TodoItemDao _todoItemDao = TodoItemDao();

  Future<List<TodoItem>> getAll() async {
    return await _todoItemDao.getAll();
  }

  Future<TodoItem> create(TodoItem item) async {
    return await _todoItemDao.create(item);
  }
}
