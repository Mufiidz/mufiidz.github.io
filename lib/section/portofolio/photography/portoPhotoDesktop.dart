import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/entity/porto.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/utils/string_ext.dart';
import 'package:myporto/widget/loading_widget.dart';
import 'package:myporto/widget/socialMediaBtn.dart';

import 'item_porto_photography_desktop.dart';

class PortoPhotoDesktop extends StatefulWidget {
  @override
  _PortoPhotoDesktopState createState() => _PortoPhotoDesktopState();
}

class _PortoPhotoDesktopState extends State<PortoPhotoDesktop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder<QuerySnapshot>(
        stream: Porto.getPortoPhotography(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingWidget();
          else {
            if (snapshot.hasError)
              return Center(
                child: Text("Terjadi Kesalahan"),
              );
            else
              return Container(
                height: height,
                width: width,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: height * 0.08),
                child: (snapshot.data.size == 0)
                    ? Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Photography",
                              style: GoogleFonts.poppins(
                                  fontSize: width < 1200
                                      ? height * 0.085
                                      : height * 0.095,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              descPhoto.setText,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  height: 2.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SocialMediaBtn(
                              height: height * 0.08,
                              icon: listSocialIcons[0],
                              url: listSocialLink[0],
                              horizontalPadding: 0,
                            )
                          ],
                        ),
                      )
                    : ItemPortoPhotoDesktop(
                        snapshot: snapshot.data,
                        height: height,
                        width: width,
                      ),
              );
          }
        });
  }
}
