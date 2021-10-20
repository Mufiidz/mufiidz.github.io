import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/entity/about.dart';
import 'package:myporto/utils/string_ext.dart';
import 'package:myporto/widget/custom_image_loader.dart';
import 'package:myporto/widget/loading_widget.dart';

import '../../utils/const.dart';

class AboutMobile extends StatefulWidget {
  @override
  _AboutMobileState createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  int _imgClicked = 0;
  bool _isDevMode = false;

  void _devMode() {
    switch (_imgClicked) {
      case 0:
        _hideWidget();
        break;
      case 5:
        _showWidget();
        break;
      default:
        _imgClicked++;
    }
  }

  void _hideWidget() {
    setState(() {
      _isDevMode = false;
    });
    _imgClicked++;
  }

  void _showWidget() {
    setState(() {
      _isDevMode = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Now you are a developer"),
    ));
    _imgClicked = 0;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder<DocumentSnapshot>(
        stream: About.getAboutMe(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingWidget();
          else {
            if (snapshot.hasError)
              return Center();
            else {
              var data = snapshot.data.data() as Map<String, dynamic>;
              var about = About.fromJson(data);
              return Container(
                width: width,
                height: height,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.5,
                      height: width * 0.5,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        child: InkWell(
                          onTap: () {
                            _devMode();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: ImageLoader(
                              image: about.image,
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "About Me",
                      style: GoogleFonts.poppins(
                          fontSize:
                              width < 768 ? height * 0.045 : height * 0.055,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      descAbout.setText,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          fontSize: height * 0.015,
                          height: 2.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: _isDevMode,
                        child: MaterialButton(
                          height: height * 0.07,
                          elevation: 4.0,
                          color: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          onPressed: () => openLink(about.link),
                          child: Text(
                            "Download CV",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: height * 0.02),
                          ),
                        ))
                  ],
                ),
              );
            }
          }
        });
  }
}
