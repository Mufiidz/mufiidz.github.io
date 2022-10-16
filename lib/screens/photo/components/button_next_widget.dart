import 'package:flutter/material.dart';

class ButtonNextWidget extends StatelessWidget {
  final IconData? icon;
  final Function()? onClick;
  const ButtonNextWidget({Key? key, this.icon, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      hoverElevation: 0,
      highlightElevation: 0,
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.4),
      onPressed: onClick,
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
