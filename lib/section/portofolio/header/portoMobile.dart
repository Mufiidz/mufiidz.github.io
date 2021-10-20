import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/entity/porto.dart';
import 'package:myporto/widget/card_porto_github.dart';
import 'package:myporto/widget/item_card.dart';
import 'package:myporto/widget/loading_widget.dart';
import 'package:myporto/utils/string_ext.dart';

import '../../../utils/const.dart';

class PortoMobile extends StatefulWidget {
  @override
  _PortoMobileState createState() => _PortoMobileState();
}

class _PortoMobileState extends State<PortoMobile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder<QuerySnapshot>(
      stream: Porto.getPortoGithub(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingWidget();
        else {
          if (snapshot.hasError)
            return Text("Terjadi Kesalahan");
          else {
            return Container(
              width: width,
              height: height,
              color: Colors.amberAccent,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.05),
              child: (snapshot.data.size == 0)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "My Portofolio",
                          style: GoogleFonts.poppins(
                              fontSize:
                                  width < 768 ? height * 0.045 : height * 0.055,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          descPorto.setText,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.015,
                              height: 2.0,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        MaterialButton(
                          height: height * 0.07,
                          elevation: 4.0,
                          color: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          onPressed: () => openLink(listSocialLink[2]),
                          child: Text(
                            "See more",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: height * 0.02),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "My Portofolio",
                          style: GoogleFonts.poppins(
                              fontSize:
                                  width < 768 ? height * 0.045 : height * 0.055,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          descPorto.setText,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: height * 0.015,
                              height: 2.0,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: width < 768 ? height * 0.2 : height * 0.25,
                          alignment: Alignment.center,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: snapshot.data.docs.map((e) {
                              var map = e.data() as Map<String, dynamic>;
                              var porto = Porto.fromJson(map);
                              porto.id = e.id;
                              return CardPortoGithub(
                                cardWidth: width < 768 ? width * 0.6 : width * 0.5,
                                elevation: 6,
                                image: porto.image,
                                linkDownload: porto.linkDownload,
                                onPressed: () => openLink(porto.link),
                                visibility: porto.visibility,
                                title: porto.title,
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        MaterialButton(
                          height: height * 0.07,
                          elevation: 4.0,
                          color: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          onPressed: () => openLink(listSocialLink[2]),
                          child: Text(
                            "See more",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: height * 0.02),
                          ),
                        ),
                      ],
                    ),
            );
          }
        }
      },
    );
  }
}
