import 'package:flutter/foundation.dart';
import 'package:knowunity/data_access/repositories/todo_item_repository.dart';
import 'package:knowunity/model/todo_item.dart';

class HomeScreenPresenter extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<TodoItem> _items = [];
  List<TodoItem> get items => _items;

  int _completedCount = 0;
  int get completedCount => _completedCount;

  void onCreate() async {
    await loadData();
  }

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    TodoItemRepository _todoItemRepository = TodoItemRepository();
    _items = await _todoItemRepository.getAll();
    _completedCount =
        _items.where((TodoItem item) => item.completed == true).length;

    _isLoading = false;
    notifyListeners();
  }

  void tapCompleted(int index) {
    if (_items[index].completed == false) {
      _items[index].completed = true;
      _completedCount++;
    } else {
      _items[index].completed = false;
      _completedCount--;
    }
    notifyListeners();
  }

  void dismissItem(int index) {
    if (_items[index].completed) {
      _completedCount--;
    }
    _items.removeAt(index);
    notifyListeners();
  }

  void addNewItem(TodoItem? item) {
    if (item != null) {
      _items.insert(0, item);
      if (item.completed) _completedCount++;
      notifyListeners();
    }
  }
}
