import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/entity/porto.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/widget/card_porto_github.dart';
import 'package:myporto/widget/loading_widget.dart';
import 'package:myporto/utils/string_ext.dart';

class PortoDesktop extends StatefulWidget {
  @override
  _PortoDesktopState createState() => _PortoDesktopState();
}

class _PortoDesktopState extends State<PortoDesktop> {
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
              return Center(
                child: Text("Terjadi Kesalahan"),
              );
            else
              return Container(
                color: Colors.amberAccent,
                height: height,
                width: width,
                child: Center(
                  child: (snapshot.data.size == 0)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "My Portofolio",
                              style: GoogleFonts.poppins(
                                  fontSize: width < 1200
                                      ? height * 0.085
                                      : height * 0.095,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: width * 0.8,
                              child: Text(
                                descPorto.setText,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    height: 2.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            MaterialButton(
                              height: 50,
                              elevation: 6.0,
                              color: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              onPressed: () => openLink(listSocialLink[2]),
                              child: Text(
                                "See more",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "My Portofolio",
                              style: GoogleFonts.poppins(
                                  fontSize: width < 1200
                                      ? height * 0.085
                                      : height * 0.095,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: width * 0.8,
                              child: Text(
                                descPorto.setText,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    height: 2.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              width: width * 0.8,
                              height: width > 1200 ? height * 0.28 : height * 0.22,
                              alignment: Alignment.center,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data.docs.map((e){
                                  var map = e.data() as Map<String, dynamic>;
                                  var porto = Porto.fromJson(map);
                                  porto.id = e.id;
                                  return CardPortoGithub(
                                    cardWidth: width > 1200 ? width * 0.25 : width * 0.2,
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
                              height: 50,
                              elevation: 6.0,
                              color: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              onPressed: () => openLink(listSocialLink[2]),
                              child: Text(
                                "See more",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                ),
              );
          }
        });
  }
}
