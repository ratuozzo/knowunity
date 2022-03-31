import 'package:flutter/material.dart';
import 'package:knowunity/model/todo_item.dart';
import 'package:knowunity/ui/home/components/completed_button.dart';

class TodoItemTile extends StatelessWidget {
  final TodoItem item;
  final Function onCompletedTap;
  final int index;

  const TodoItemTile({
    Key? key,
    required this.item,
    required this.onCompletedTap,
    required this.index,
  }) : super(key: key);

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
        tileColor: (index % 2 == 0)
            ? Colors.transparent
            : Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
