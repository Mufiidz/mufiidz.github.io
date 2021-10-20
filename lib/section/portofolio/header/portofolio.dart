import 'package:flutter/cupertino.dart';
import 'package:myporto/section/portofolio/header/portoDesktop.dart';
import 'package:myporto/section/portofolio/header/portoMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Portofolio extends StatefulWidget {
  @override
  _PortofolioState createState() => _PortofolioState();
}

class _PortofolioState extends State<Portofolio> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        desktop: PortoDesktop(),
        tablet: PortoMobile(),
        mobile: PortoMobile()
    );
  }
}
