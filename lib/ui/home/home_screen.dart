import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knowunity/ui/home/components/todo_item_tile.dart';
import 'package:knowunity/ui/home/components/todo_item_tile_background.dart';
import 'package:knowunity/ui/home/home_screen_presenter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenPresenter>(
      create: (context) => _createPresenter()..onCreate(),
      child: Scaffold(
        body: Consumer<HomeScreenPresenter>(
          builder: (context, presenter, _) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  child: TodoItemTile(
                    item: presenter.items[index],
                    onCompletedTap: () => presenter.tapCompleted(index),
                  ),
                  background: const TodoItemTileBackground(),
                  onDismissed: (DismissDirection direction) =>
                      presenter.dismissItem(index),
                );
              },
              itemCount: presenter.items.length,
            );
          },
        ),
      ),
    );
  }

  HomeScreenPresenter _createPresenter() {
    return HomeScreenPresenter();
  }
}
