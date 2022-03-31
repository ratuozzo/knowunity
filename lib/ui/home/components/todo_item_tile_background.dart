import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TodoItemTileBackground extends StatelessWidget {
  const TodoItemTileBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      color: Colors.redAccent,
      child: const Icon(
        FontAwesomeIcons.trashCan,
        size: 25,
      ),
      alignment: Alignment.centerRight,
    );
  }
}
