import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myporto/section/mainSection.dart';
import 'package:myporto/utils/custom_scroll_behavior.dart';
import 'package:myporto/widget/theme_widget.dart';

import 'config/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text(snapshot.error.toString());
        else if (snapshot.connectionState == ConnectionState.done)
          return ThemeSwitcherWidget(
            initDarkMode: false,
            child: Home(),
          );
        return CircularProgressIndicator();
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rifqi Mufidianto',
      theme: ThemeSwitcher.of(context).isDarkMode
          ? darkTheme(context)
          : lightTheme(context),
      home: MainPage(),
      scrollBehavior: CustomScrollBeahvior(),
    );
  }
}