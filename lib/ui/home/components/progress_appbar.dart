import 'package:flutter/material.dart';
import 'package:knowunity/ui/home/home_screen_presenter.dart';
import 'package:provider/provider.dart';

class ProgressAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ProgressAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF5F6CFB),
      toolbarHeight: kToolbarHeight * 1.5,
      title: Consumer<HomeScreenPresenter>(
        builder: (context, presenter, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25, bottom: 10),
                child: LinearProgressIndicator(
                  value: presenter.isLoading
                      ? 0
                      : _getProgressValue(
                          presenter.items.length, presenter.completedCount),
                  color: const Color(0xFF52D4FA),
                  backgroundColor: Colors.white,
                  minHeight: 8,
                ),
              ),
              Text(
                (presenter.isLoading
                        ? '0'
                        : presenter.completedCount.toString()) +
                    '/' +
                    (presenter.isLoading
                        ? '0'
                        : presenter.items.length.toString()) +
                    ' completed',
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}

double _getProgressValue(int total, int completed) {
  return completed / total;
}
