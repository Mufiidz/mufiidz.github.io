import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/utils/string_ext.dart';
import 'package:myporto/entity/porto.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/widget/socialMediaBtn.dart';

import '../../../widget/item_card.dart';

class ItemPortoPhotoDesktop extends StatefulWidget {
  final QuerySnapshot snapshot;
  final double height;
  final double width;

  const ItemPortoPhotoDesktop({Key key, this.snapshot, this.height, this.width})
      : super(key: key);

  @override
  _ItemPortoPhotoDesktopState createState() => _ItemPortoPhotoDesktopState();
}

class _ItemPortoPhotoDesktopState extends State<ItemPortoPhotoDesktop> {
  @override
  Widget build(BuildContext context) {
    QuerySnapshot querySnapshot = widget.snapshot;
    double height = widget.height;
    double width = widget.width;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Photography",
                style: GoogleFonts.poppins(
                    fontSize: width < 1200 ? height * 0.085 : height * 0.095,
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
        ),
        SizedBox(
          width: 32,
        ),
        Expanded(child: Container(
          height: 300,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: querySnapshot.docs.map((e){
              var map = e.data() as Map<String, dynamic>;
              var porto = Porto.fromJson(map);
              porto.id = e.id;
              return ItemCard(
                cardWidth: 300,
                cardHeight: 300,
                elevation: 10,
                image: porto.image,
                linkDownload: porto.linkDownload,
                onPressed: () => openLink(porto.link),
                visibility: porto.visibility,
                title: porto.title,
              );
            }).toList(),
          ),
        ))
      ],
    );
  }
}