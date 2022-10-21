import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const TitleSectionWidget({Key? key, required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
          fontSize: 40, fontWeight: FontWeight.bold, color: color),
    );
  }
}
