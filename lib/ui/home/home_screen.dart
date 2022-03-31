import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knowunity/ui/home/components/create_todo_dialog/create_todo_dialog.dart';
import 'package:knowunity/ui/home/components/progress_appbar.dart';
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
        appBar: const ProgressAppbar(),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            Consumer<HomeScreenPresenter>(builder: (context, presenter, _) {
          return FloatingActionButton(
            child: const Icon(FontAwesomeIcons.plus),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return const CreateTodoDialog();
                },
              ).then((newItem) {
                presenter.addNewItem(newItem);
              });
            },
          );
        }),
      ),
    );
  }

  HomeScreenPresenter _createPresenter() {
    return HomeScreenPresenter();
  }
}
