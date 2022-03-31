import 'package:flutter/cupertino.dart';
import 'package:knowunity/data_access/repositories/todo_item_repository.dart';
import 'package:knowunity/model/todo_item.dart';

class CreateTodoDialogPresenter extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _completed = false;
  bool get completed => _completed;

  TextEditingController titleController = TextEditingController();

  void onCreate() {}

  void save(BuildContext context) async {
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
