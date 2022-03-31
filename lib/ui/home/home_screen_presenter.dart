import 'package:flutter/foundation.dart';
import 'package:knowunity/data_access/repositories/todo_item_repository.dart';
import 'package:knowunity/model/todo_item.dart';

class HomeScreenPresenter extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<TodoItem> _items = [];
  List<TodoItem> get items => _items;

  void onCreate() async {
    await loadData();
  }

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    TodoItemRepository _todoItemRepository = TodoItemRepository();
    _items = await _todoItemRepository.getAll();

    _isLoading = false;
    notifyListeners();
  }
}
