import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/utils/const.dart';

class CustomCard extends StatefulWidget {
  final VoidCallback onPressed;
  final double cardWidth;
  final double cardHeight;
  final IconData icon;
  final String title;
  final String desc;

  const CustomCard({
    Key key,
    this.onPressed,
    this.cardWidth,
    this.cardHeight,
    this.icon,
    this.title,
    this.desc,
  }) : super(key: key);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        width: widget.cardWidth,
        height: widget.cardHeight,
        child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(6),
                left: Radius.circular(6),
              ),
            ),
            child: InkWell(
              onTap: widget.onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    color: primaryColor,
                    size: height * 0.1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      fontSize: height * 0.02,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.desc,
                    style: GoogleFonts.poppins(
                        fontSize: height * 0.015,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w200,
                        height: width >= 600 ? 2.0 : 1.5),
                  ),
                ],
              ),
            )
        )
    );
  }
}
