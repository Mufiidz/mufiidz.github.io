import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/entity/porto.dart';
import 'package:myporto/utils/string_ext.dart';
import 'package:myporto/widget/item_card.dart';
import 'package:myporto/widget/loading_widget.dart';
import 'package:myporto/widget/socialMediaBtn.dart';

import '../../../utils/const.dart';

class PortoDesignMobile extends StatefulWidget {
  @override
  _PortoDesignMobileState createState() => _PortoDesignMobileState();
}

class _PortoDesignMobileState extends State<PortoDesignMobile> {
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
                  width: width,
                  height: height,
                  color: Colors.grey,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.05),
                  child: (snapshot.data.size == 0)
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Design",
                                style: GoogleFonts.poppins(
                                    fontSize: width < 768
                                        ? height * 0.045
                                        : height * 0.055,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                descDesign.setText,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(
                                    fontSize: height * 0.015,
                                    height: 2.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SocialMediaBtn(
                                height: height * 0.05,
                                icon: listSocialIcons[4],
                                url: listSocialLink[4],
                                horizontalPadding: 0,
                              )
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Design",
                              style: GoogleFonts.poppins(
                                  fontSize: width < 768
                                      ? height * 0.045
                                      : height * 0.055,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              descDesign.setText,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                  fontSize: height * 0.015,
                                  height: 2.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: width < 500 ? width * 0.55 : width * 0.3,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data.docs.map((e) {
                                  var map = e.data() as Map<String, dynamic>;
                                  var porto = Porto.fromJson(map);
                                  porto.id = e.id;
                                  return ItemCard(
                                    cardWidth: 200,
                                    cardHeight: 200,
                                    elevation: 6,
                                    linkDownload: porto.linkDownload,
                                    image: porto.image,
                                    onPressed: () => openLink(porto.link),
                                    visibility: porto.visibility,
                                    title: porto.title,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            SocialMediaBtn(
                              height: height * 0.05,
                              icon: listSocialIcons[4],
                              url: listSocialLink[4],
                              horizontalPadding: 0,
                            )
                          ],
                        ));
            }
          }
        });
  }
}
