import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/widget/custom_image_loader.dart';

class CardPortoGithub extends StatefulWidget {
  final VoidCallback onPressed;
  final double cardWidth;
  final String image;
  final String linkDownload;
  final String title;
  final bool visibility;
  final double elevation;

  const CardPortoGithub({
    Key key,
    this.onPressed,
    this.cardWidth,
    this.image,
    this.title,
    this.visibility,
    this.elevation,
    this.linkDownload,
  }) : super(key: key);

  @override
  _CardPortoGithubState createState() => _CardPortoGithubState();
}

class _CardPortoGithubState extends State<CardPortoGithub> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: InkWell(
        onTap: widget.onPressed,
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6))),
          child: Stack(
            children: [
              Container(
                width: widget.cardWidth,
                child: ImageLoader(
                  image: widget.image,
                  fit: BoxFit.cover,
                )
              ),
              Visibility(
                visible: widget.linkDownload != null,
                child: IconButton(
                  onPressed: () => openLink(widget.linkDownload),
                  icon: Icon(Icons.download),
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Visibility(
                        visible: widget.title.isNotEmpty,
                        child: Container(
                          width: widget.cardWidth,
                          alignment: Alignment.centerLeft,
                          height: 50,
                          padding:
                          EdgeInsets.only(right: 10, top: 10, left: 10),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [Color(0x00000000), Colors.black])),
                          child: Text(
                            widget.title,
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                height: 2.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
