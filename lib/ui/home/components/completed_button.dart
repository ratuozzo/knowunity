import 'package:flutter/material.dart';

class CompletedButton extends StatelessWidget {
  final bool done;
  final Function onTap;

  const CompletedButton({Key? key, required this.done, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () => onTap(),
      child: Container(
        width: 50,
        height: 45,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.5,
          vertical: 10,
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          child: done
              ? Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: Colors.green,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
