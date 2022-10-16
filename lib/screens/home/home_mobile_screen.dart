import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';
import 'package:myporto/screens/about/about_mobile_section.dart';
import 'package:myporto/screens/contact/contact_desktop_section.dart';
import 'package:myporto/screens/design/design_mobile_section.dart';
import 'package:myporto/screens/header/header_mobile_section.dart';
import 'package:myporto/screens/home/component/item_drawer_appbar.dart';
import 'package:myporto/screens/home/component/mobile_appbar.dart';
import 'package:myporto/screens/photo/photo_mobile_section.dart';
import 'package:myporto/screens/portfolio/portfolio_mobile_section.dart';
import 'package:myporto/utils/utils_export.dart';

class HomeMobileScreen extends StatefulWidget {
  final bool isDarkMode;
  const HomeMobileScreen({Key? key, required this.isDarkMode})
      : super(key: key);

  @override
  State<HomeMobileScreen> createState() => _HomeMobileScreenState();
}

class _HomeMobileScreenState extends State<HomeMobileScreen> {
  final ScrollController _controller = ScrollController();
  bool isTop = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView.builder(
            itemBuilder: (context, index) => _contentDrawer(context)[index],
            itemCount: _contentDrawer(context).length),
      ),
      body: Stack(
        children: [
          NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              final pixels = notification.metrics.pixels;
              if (pixels <= 100) {
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
                physics: const BouncingScrollPhysics(),
                children: [
                  HeaderMobileSection(
                    isDarkMode: widget.isDarkMode,
                  ),
                  const AboutMobileSection(),
                  const PortfolioMobileSection(),
                  const PhotoMobileSection(),
                  const DesignMobileSection(),
                  ContactDesktopSection(
                    isMobile: true,
                    isDarkMode: widget.isDarkMode,
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: MobileAppbar(
                isDarkMode: widget.isDarkMode,
                isTop: isTop,
              ))
        ],
      ),
    );
  }

  List<Widget> _contentDrawer(BuildContext context) => [
        DrawerHeader(
            child: SizedBox(
                width: 24,
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () => context.popRoute(),
                      icon: const Icon(Icons.close)),
                ))),
        ItemDrawerAppbar(
            text: 'About',
            onClick: () {
              _animateToIndex(1, context);
              context.popRoute();
            }),
        ItemDrawerAppbar(
            text: 'Portfolio',
            onClick: () {
              _animateToIndex(2, context);
              context.popRoute();
            }),
        ItemDrawerAppbar(
            text: 'Contact',
            onClick: () {
              _animateToIndex(5, context);
              context.popRoute();
            }),
      ];

  void _animateToIndex(double index, BuildContext context) {
    _controller.animateTo(
      index * context.mediaSize.height,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
}
