import 'package:flutter/cupertino.dart';
import 'package:myporto/section/construction/construction.dart';
import 'package:myporto/section/portofolio/design/PortoDesignMobile.dart';
import 'package:myporto/section/portofolio/design/portoDesignDesktop.dart';
import 'package:myporto/section/portofolio/design/porto_design_mobile.dart';
import 'package:myporto/section/portofolio/header/portoDesktop.dart';
import 'package:myporto/section/portofolio/header/portoMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PortoDesign extends StatefulWidget {
  @override
  _PortoDesignState createState() => _PortoDesignState();
}

class _PortoDesignState extends State<PortoDesign> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        desktop: PortoDesignDesktop(),
        tablet: PortoDesignMobile2(),
        mobile: PortoDesignMobile2()
    );
  }
}
