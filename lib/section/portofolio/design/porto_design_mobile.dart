import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:myporto/entity/porto.dart';
import 'package:myporto/section/construction/construction.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/widget/item_card.dart';
import 'package:myporto/widget/loading_widget.dart';
import 'package:myporto/widget/socialMediaBtn.dart';
import 'package:myporto/utils/string_ext.dart';

class PortoDesignMobile2 extends StatefulWidget {
  @override
  _PortoDesignMobile2State createState() => _PortoDesignMobile2State();
}

class _PortoDesignMobile2State extends State<PortoDesignMobile2> {
  Widget _noListPorto(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Design",
          style: GoogleFonts.poppins(
              fontSize: width < 768 ? height * 0.045 : height * 0.055,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          loremIpsum(words: 50),
          style: GoogleFonts.poppins(
              fontSize: height * 0.016,
              letterSpacing: 1,
              fontWeight: FontWeight.w300),
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
    );
  }

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
              return ConstructionDesktop();
            else {
              return Container(
                width: width,
                height: height,
                color: Color.fromARGB(255, 88, 183, 146),
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.05),
                child: (snapshot.data.size == 0)
                    ? _noListPorto(width, height)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Design",
                            style: GoogleFonts.poppins(
                                fontSize: width < 768 ? height * 0.045 : height * 0.055,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            descDesign.setText,
                            style: GoogleFonts.poppins(
                                fontSize: height * 0.016,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            height: width < 500 ? width * 0.55 : width * 0.3,
                            child: ListView(
                              shrinkWrap: true,
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
                      ),
              );
            }
          }
        });
  }
}
