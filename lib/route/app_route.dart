import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:myporto/screens/home/home_screen.dart';
import 'package:myporto/screens/links/links_screen.dart';

part 'app_route.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  AutoRoute(page: HomeScreen, initial: true),
  AutoRoute(path: LinksScreen.name, page: LinksScreen, fullMatch: true),
  RedirectRoute(path: '/link', redirectTo: LinksScreen.name),
])
class AppRoute extends _$AppRoute {
  AppRoute._();

  static final instance = AppRoute._();
}
