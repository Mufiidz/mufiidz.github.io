import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/entity/porto.dart';
import 'package:myporto/section/portofolio/design/item_porto_design.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/utils/string_ext.dart';
import 'package:myporto/widget/loading_widget.dart';
import 'package:myporto/widget/socialMediaBtn.dart';

class PortoDesignDesktop extends StatefulWidget {
  @override
  _PortoDesignDesktopState createState() => _PortoDesignDesktopState();
}

class _PortoDesignDesktopState extends State<PortoDesignDesktop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder<QuerySnapshot>(
        stream: Porto.getPortoDesign(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingWidget();
          else {
            if (snapshot.hasError)
              return Center(
                child: Text("Terjadi Kesalahan"),
              );
            else {
              return Container(
                color: Color.fromARGB(255, 88, 183, 146),
                height: height,
                width: width,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: height * 0.08),
                child: (snapshot.data.size == 0)
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Design",
                            style: GoogleFonts.poppins(
                                fontSize: width > 1200
                                    ? height * 0.085
                                    : height * 0.095,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            descDesign.setText,
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
                            icon: listSocialIcons[4],
                            url: listSocialLink[4],
                            horizontalPadding: 0,
                          )
                        ],
                      ))
                    : ItemPortoDesign(
                        snapshot: snapshot.data,
                        height: height,
                        width: width,
                      ),
              );
            }
          }
        });
  }
}
