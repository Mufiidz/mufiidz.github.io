import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final Function()? onClick;
  final bool isDarkMode;
  final double padding;
  const ButtonText(
      {Key? key,
      required this.text,
      this.onClick,
      required this.isDarkMode,
      this.padding = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextButton(
          onPressed: onClick,
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.blue;
                }
                return isDarkMode ? Colors.white : Colors.black;
              },
            ),
          ),
          child: Text(
            text,
            textScaleFactor: 1,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )),
    );
  }
}
