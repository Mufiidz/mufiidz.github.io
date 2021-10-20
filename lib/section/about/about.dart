import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'aboutDesktop.dart';
import 'aboutMobile.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        desktop: AboutDesktop(),
        tablet: AboutMobile(),
        mobile: AboutMobile()
    );
  }
}
