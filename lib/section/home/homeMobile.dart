import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/widget/socialMediaBtn.dart';

import '../../utils/const.dart';

class HomeMobile extends StatefulWidget {
  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {

  final random = new Random();

  String getRandomGreeting() {
    var i = random.nextInt(listGreetings.length);
    return listGreetings[i];
  }

  String getRandomCover() {
    var i = random.nextInt(listCoverImage.length);
    return listCoverImage[i];
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print("w -> $width h -> $height | ${width > 1200 ? width * 0.3 : width * 0.2}");
    return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          Image.asset(
            getRandomCover(),
            height: height,
            width: width,
            fit: BoxFit.fitHeight,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(width * 0.07, height * 0.12, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      getRandomGreeting(),
                      style: GoogleFonts.poppins(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Image.asset("assets/hi.gif", height: height * 0.03)
                  ],
                ),
                Text(
                  "Rifqi \nMufidianto",
                  style: GoogleFonts.poppins(
                      fontSize: height * 0.055,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < listSocialIcons.length; i++)
                      SocialMediaBtn(
                        icon: listSocialIcons[i],
                        url: listSocialLink[i],
                        height: height * 0.03,
                        horizontalPadding: 2,
                      )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
