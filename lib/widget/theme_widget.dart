import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ThemeSwitcher extends InheritedWidget {
  final _ThemeSwitcherWidgetState data;

  const ThemeSwitcher({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static _ThemeSwitcherWidgetState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>()).data;
  }

  @override
  bool updateShouldNotify(ThemeSwitcher old) {
    return this != old ;
  }
}

class ThemeSwitcherWidget extends StatefulWidget {
  final bool initDarkMode;
  final Widget child;

  const ThemeSwitcherWidget({Key key, this.initDarkMode, this.child}) :
        assert(initDarkMode != null),
        assert(child != null),
        super(key: key);

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  bool isDarkMode;

  void switchDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = isDarkMode ?? widget.initDarkMode;
    return ThemeSwitcher(data: this, child: widget.child);
  }
}