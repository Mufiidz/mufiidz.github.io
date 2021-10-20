import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/widget/theme_widget.dart';

class FooterDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      width: width,
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => openLink("https://s.id/HSzQT"),
            child: Image.asset(
              "assets/logo.png",
              width: height * 0.1,
              height: height * 0.1,
              color: ThemeSwitcher.of(context).isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () => {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(lastUpdated),
              ))
            },
            child: Text(
              "This portfolio was developed by $footerName.",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w200),
            ),
          )
        ],
      ),
    );
  }
}
