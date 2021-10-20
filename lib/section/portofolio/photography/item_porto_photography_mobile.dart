import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/utils/string_ext.dart';
import 'package:myporto/entity/porto.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/widget/socialMediaBtn.dart';

import '../../../widget/item_card.dart';

class ItemPortoPhotoMobile extends StatefulWidget {
  final QuerySnapshot snapshot;
  final double height;
  final double width;

  const ItemPortoPhotoMobile({Key key, this.snapshot, this.height, this.width})
      : super(key: key);

  @override
  _ItemPortoPhotoMobileState createState() => _ItemPortoPhotoMobileState();
}

class _ItemPortoPhotoMobileState extends State<ItemPortoPhotoMobile> {
  @override
  Widget build(BuildContext context) {
    QuerySnapshot querySnapshot = widget.snapshot;
    double height = widget.height;
    double width = widget.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: width < 500 ? width * 0.55 : width * 0.3,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: querySnapshot.docs.map((e){
              var map = e.data() as Map<String, dynamic>;
              var porto = Porto.fromJson(map);
              porto.id = e.id;
              return ItemCard(
                cardWidth: 200,
                cardHeight: 200,
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
        Text(
          "Photography",
          style: GoogleFonts.poppins(
              fontSize: width < 768 ? height * 0.045 : height * 0.055,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          descPhoto.setText,
          textAlign: TextAlign.justify,
          style: GoogleFonts.poppins(
              fontSize: height * 0.015,
              height: 2.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w300),
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
    );
  }
}
