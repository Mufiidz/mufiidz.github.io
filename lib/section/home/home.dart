import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'homeDesktop.dart';
import 'homeMobile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: HomeDesktop(),
      tablet: HomeMobile(),
      mobile: HomeMobile(),
    );
  }
}
