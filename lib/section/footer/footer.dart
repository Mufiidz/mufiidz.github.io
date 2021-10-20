import 'package:flutter/cupertino.dart';
import 'package:myporto/section/footer/footerDesktop.dart';
import 'package:myporto/section/footer/footerMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterPage extends StatefulWidget {
  @override
  _FooterPageState createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: FooterMobile(),
      tablet: FooterMobile(),
      desktop: FooterDesktop(),
    );
  }
}
