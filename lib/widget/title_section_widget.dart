import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/utils/utils_export.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const TitleSectionWidget({Key? key, required this.title, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaleFactor: 1,
      style: GoogleFonts.montserrat(
          textStyle: context.textTheme.displaySmall,
          fontWeight: FontWeight.bold,
          color: color),
    );
  }
}
