import 'package:flutter/material.dart';
import 'package:knowunity/ui/home/components/completed_button.dart';
import 'package:knowunity/ui/home/components/create_todo_dialog/create_todo_dialog_presenter.dart';
import 'package:provider/provider.dart';

class CreateTodoDialog extends StatelessWidget {
  const CreateTodoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CreateTodoDialogPresenter>(
      create: (context) => _createPresenter()..onCreate(),
      child: Consumer<CreateTodoDialogPresenter>(
        builder: (context, presenter, _) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              height: 300,
              width: 350,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: presenter.isLoading
                  ? const Center(
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0xFF52D4FA),
                        ),
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text(
                              'New todo item',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TextField(
                              controller: presenter.titleController,
                              decoration: InputDecoration(
                                hintText: 'Title',
                                errorText: presenter.errorMessage,
                              ),
                            ),
                            Container(height: 15),
                            Row(
                              children: [
                                const Text('Completed'),
                                Container(width: 15),
                                CompletedButton(
                                  done: presenter.completed,
                                  onTap: () => presenter.tapCompleted(),
                                ),
                              ],
                            ),
                            Container(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                    elevation: MaterialStateProperty.all(2),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => presenter.save(context),
                                  child: const Text('Save'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                    elevation: MaterialStateProperty.all(2),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  CreateTodoDialogPresenter _createPresenter() {
    return CreateTodoDialogPresenter();
  }
}
