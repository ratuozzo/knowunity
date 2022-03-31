import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  background: Container(
                    padding: const EdgeInsets.only(right: 10),
                    color: Colors.red,
                    child: const Icon(
                      FontAwesomeIcons.trashCan,
                      size: 25,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  child: ListTile(
                    title: Text(presenter.items[index].title ?? ''),
                  ),
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
