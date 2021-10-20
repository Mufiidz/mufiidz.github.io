import 'package:flutter/cupertino.dart';
import 'package:myporto/section/contact/contactMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'contactDesktop.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        desktop: ContactDesktop(),
        tablet: ContactMobile(),
        mobile: ContactMobile()
    );
  }
}
