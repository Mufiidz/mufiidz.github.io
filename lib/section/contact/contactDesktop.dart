import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/utils/string_ext.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/widget/custom_card.dart';

class ContactDesktop extends StatefulWidget {
  @override
  _ContactDesktopState createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("w -> $width h -> $height | ${width > 1200 ? width * 0.3 : width * 0.2}");
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.08, vertical: height * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Contact Me",
            style: GoogleFonts.poppins(
                fontSize: width < 1200 ? height * 0.085 : height * 0.095,
                fontWeight: FontWeight.w500),
          ),
          Text(
            descContact.setText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 14,
                height: 2.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(
                cardWidth: width >= 1280 ? width * 0.3 : width * 0.25,
                cardHeight: width > 1200 ? height * 0.28 : height * 0.25,
                icon: listContactIcons[0],
                title: listContactTitles[0],
                desc: listContactDetails[0],
              ),
              SizedBox(height: 8,),
              CustomCard(
                cardWidth: width >= 1280 ? width * 0.3 : width * 0.25,
                cardHeight: width > 1200 ? height * 0.28 : height * 0.25,
                icon: listContactIcons[1],
                title: listContactTitles[1],
                desc: listContactDetails[1],
                onPressed: () => openLink("mailto:${listContactDetails[1]}"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
