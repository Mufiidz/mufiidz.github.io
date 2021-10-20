import 'package:flutter/cupertino.dart';
import 'package:myporto/section/portofolio/photography/portoPhotoDesktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'PortoPhotoMobile.dart';

class PortoPhotography extends StatefulWidget {
  @override
  _PortoPhotographyState createState() => _PortoPhotographyState();
}

class _PortoPhotographyState extends State<PortoPhotography> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        desktop: PortoPhotoDesktop(),
        tablet: PortoPhotoMobile(),
        mobile: PortoPhotoMobile()
    );
  }
}
