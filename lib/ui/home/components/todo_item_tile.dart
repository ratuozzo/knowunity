import 'package:flutter/material.dart';
import 'package:knowunity/model/todo_item.dart';
import 'package:knowunity/ui/home/components/completed_button.dart';

class TodoItemTile extends StatelessWidget {
  final TodoItem item;
  final Function onCompletedTap;

  const TodoItemTile(
      {Key? key, required this.item, required this.onCompletedTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
      ),
      child: ListTile(
        title: Text(item.title ?? ""),
        leading: CompletedButton(
          done: item.completed,
          onTap: () => onCompletedTap(),
        ),
      ),
    );
  }
}
