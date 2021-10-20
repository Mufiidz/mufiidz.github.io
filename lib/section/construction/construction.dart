import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Construction extends StatefulWidget {
  @override
  _ConstructionState createState() => _ConstructionState();
}

class _ConstructionState extends State<Construction> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ConstructionDesktop(),
      desktop: ConstructionDesktop(),
    );
  }
}

class ConstructionDesktop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Coming Soon",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50),
              ),
              Text(
                "Under Construction",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              )
            ],
          )
      ),
    );
  }
}