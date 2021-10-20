import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/entity/porto.dart';
import 'package:myporto/utils/string_ext.dart';
import 'package:myporto/widget/loading_widget.dart';
import 'package:myporto/widget/socialMediaBtn.dart';

import '../../../utils/const.dart';
import 'item_porto_photography_mobile.dart';

class PortoPhotoMobile extends StatefulWidget {
  @override
  _PortoPhotoMobileState createState() => _PortoPhotoMobileState();
}

class _PortoPhotoMobileState extends State<PortoPhotoMobile> {
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
                  width: width,
                  height: height,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.05),
                  child: (snapshot.data.size == 0)
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Photography",
                                style: GoogleFonts.poppins(
                                    fontSize: width < 768
                                        ? height * 0.045
                                        : height * 0.055,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                descPhoto.setText,
                                textAlign: TextAlign.justify,
                                style: TextStyle(letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              SocialMediaBtn(
                                height: height * 0.05,
                                icon: listSocialIcons[0],
                                url: listSocialLink[0],
                                horizontalPadding: 0,
                              )
                            ],
                          ),
                        )
                      : ItemPortoPhotoMobile(
                          snapshot: snapshot.data,
                          height: height,
                          width: width,
                        ));
          }
        });
  }
}
