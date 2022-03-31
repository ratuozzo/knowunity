import 'package:flutter/material.dart';
import 'package:knowunity/data_access/repositories/todo_item_repository.dart';
import 'package:knowunity/model/todo_item.dart';

class CreateTodoDialogPresenter extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _completed = false;
  bool get completed => _completed;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  TextEditingController titleController = TextEditingController();

  void onCreate() {
    titleController.addListener(() {
      if (_errorMessage != null &&
          (titleController.text.isNotEmpty || titleController.text != '')) {
        _errorMessage = null;
        notifyListeners();
      }
    });
  }

  void save(BuildContext context) async {
    if (titleController.text.isEmpty || titleController.text == '') {
      _errorMessage = "Title can't be empty";
      notifyListeners();
      return;
    }
    TodoItemRepository todoItemRepository = TodoItemRepository();
    TodoItem newItem = await todoItemRepository.create(
      TodoItem(
        userId: 35608,
        title: titleController.text,
        completed: _completed,
      ),
    );
    Navigator.pop(context, newItem);
  }

  void tapCompleted() {
    _completed = !_completed;
    notifyListeners();
  }
}
