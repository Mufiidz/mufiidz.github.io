import 'package:flutter/material.dart';

import '../../../res/export_res.dart';

class ImageHeaderWidget extends StatelessWidget {
  final AlignmentGeometry align;
  final double size;
  final bool isDarkMode;
  const ImageHeaderWidget({
    Key? key,
    required this.align,
    required this.size,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Image.asset(Assets.logo,
          width: size,
          height: size,
          color: isDarkMode ? Colors.white : Colors.black),
    );
  }
}
