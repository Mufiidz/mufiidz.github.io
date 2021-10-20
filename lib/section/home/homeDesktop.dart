import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/widget/custom_image_loader.dart';
import 'package:myporto/widget/socialMediaBtn.dart';

class HomeDesktop extends StatefulWidget {
  @override
  _HomeDesktopState createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {

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
    return Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: Image.asset(getRandomCover(), fit: BoxFit.fill)
            ),
            Positioned(
              top: width < 1200 ? height * 0.15 : height * 0.1,
              right: width * 0.01,
              child: Opacity(
                opacity: 0.9,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(width * 0.1, height * 0.2, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        getRandomGreeting(),
                        style: GoogleFonts.poppins(
                            fontSize: height * 0.03,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Image.asset("assets/hi.gif", height: height * 0.05)
                    ],
                  ),
                  Text(
                    "Rifqi \nMufidianto",
                    style: GoogleFonts.poppins(
                        fontSize:
                            width < 1200 ? height * 0.085 : height * 0.095,
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
                          height: height * 0.05,
                          horizontalPadding: width * 0.003,
                        )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
