import 'package:flutter/material.dart';

class TitleHeaderWidget extends StatelessWidget {
  final TextStyle? textNameStyle;
  const TitleHeaderWidget({Key? key, this.textNameStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hi! I\'m',
          style: TextStyle(fontSize: 20),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Rifqi\nMufidianto',
          style: textNameStyle?.copyWith(
            fontFamily: 'Windlass',
          ),
        ),
      ],
    );
  }
}
