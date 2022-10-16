import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/data/config/firebase_config.dart';
import 'package:myporto/res/export_res.dart';
import 'package:myporto/route/app_route.dart';
import 'package:myporto/utils/custom_scroll_behavior.dart';

import 'bloc/theme_mode_bloc.dart';
import 'di/main_module.dart';

void main() async {
  FirebaseConfig.setupFirebase();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseConfig.options);
  setUrlStrategy(PathUrlStrategy());
  setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeModeBloc(),
      child: BlocSelector<ThemeModeBloc, ThemeModeState, bool>(
        selector: (state) => state.isDarkMode,
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Rifqi Mufidianto',
            themeMode: state ? ThemeMode.dark : ThemeMode.light,
            scrollBehavior: CustomScrollBeahvior(),
            theme:
                _baseTheme(context, state ? Brightness.dark : Brightness.light),
            routerDelegate: AppRoute.instance.delegate(),
            routeInformationParser: AppRoute.instance.defaultRouteParser(),
          );
        },
      ),
    );
  }

  ThemeData _baseTheme(BuildContext context, Brightness brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
      useMaterial3: true,
      primarySwatch: MyColors.primary,
    );
    return baseTheme.copyWith(
      textTheme: GoogleFonts.nunitoTextTheme(baseTheme.textTheme),
    );
  }
}
