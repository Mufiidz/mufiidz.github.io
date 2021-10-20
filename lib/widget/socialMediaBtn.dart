import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myporto/utils/const.dart';

class SocialMediaBtn extends StatelessWidget {
  final String icon;
  final String url;
  final double height;
  final double horizontalPadding;

  const SocialMediaBtn({Key key, this.icon, this.url, this.height, this.horizontalPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: IconButton(
        icon: Image.network(icon),
        iconSize: height,
        onPressed: () => openLink(url),
        hoverColor: primaryColor.withAlpha(150),
      ),
    );
  }
}
