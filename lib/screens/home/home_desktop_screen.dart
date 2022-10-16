import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:myporto/screens/about/about_desktop_section.dart';
import 'package:myporto/screens/contact/contact_desktop_section.dart';
import 'package:myporto/screens/design/design_desktop_section.dart';
import 'package:myporto/screens/header/header_desktop_section.dart';
import 'package:myporto/screens/home/component/desktop_appbar.dart';
import 'package:myporto/screens/photo/photo_desktop_section.dart';

import '../portfolio/portfolio_desktop_section.dart';

class HomeDesktopScreen extends StatefulWidget {
  final bool isDarkMode;
  const HomeDesktopScreen({Key? key, required this.isDarkMode})
      : super(key: key);

  @override
  State<HomeDesktopScreen> createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen> {
  final ScrollController _controller = ScrollController();
  bool isTop = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              final pixels = notification.metrics.pixels;
              if (pixels <= 50) {
                setState(() {
                  isTop = true;
                });
              } else {
                setState(() {
                  isTop = false;
                });
              }
              return true;
            },
            child: ImprovedScrolling(
              scrollController: _controller,
              enableMMBScrolling: true,
              enableKeyboardScrolling: true,
              enableCustomMouseWheelScrolling: true,
              child: ListView(
                controller: _controller,
                children: [
                  HeaderDesktopSection(
                    isDarkMode: widget.isDarkMode,
                  ),
                  const AboutDesktopSection(),
                  const PortfolioDesktopSection(),
                  const PhotoDesktopSection(),
                  const DesignDesktopSection(),
                  ContactDesktopSection(
                    isDarkMode: widget.isDarkMode,
                  ),
                ],
              ),
            ),
          ),
          DesktopAppbar(isTop: isTop, controller: _controller)
        ],
      ),
    );
  }
}
