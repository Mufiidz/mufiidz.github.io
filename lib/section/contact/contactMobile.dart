import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/utils/string_ext.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/widget/custom_card.dart';

class ContactMobile extends StatefulWidget {
  @override
  _ContactMobileState createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Contact Me",
            style: GoogleFonts.poppins(
                fontSize: width < 768 ? height * 0.045 : height * 0.055,
                fontWeight: FontWeight.w500),
          ),
          Text(
            descContact.setText,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: height * 0.015,
                height: 2.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 16,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(
                cardWidth: width <= 768 ? width * 0.8 : width * 0.5,
                cardHeight: width < 768 ? height * 0.25 : height * 0.3,
                icon: listContactIcons[0],
                title: listContactTitles[0],
                desc: listContactDetails[0],
              ),
              SizedBox(height: 8,),
              CustomCard(
                cardWidth: width <= 768 ? width * 0.8 : width * 0.5,
                cardHeight: width < 768 ? height * 0.25 : height * 0.3,
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
