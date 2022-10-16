import 'package:flutter/material.dart';

class ItemDrawerAppbar extends StatelessWidget {
  final String text;
  final Function()? onClick;
  const ItemDrawerAppbar({Key? key, required this.text, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      dense: true,
      onTap: onClick,
      title: Text(
        text,
        textScaleFactor: 1,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
