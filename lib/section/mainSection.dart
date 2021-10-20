import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myporto/section/contact/contact.dart';
import 'package:myporto/section/footer/footer.dart';
import 'package:myporto/section/portofolio/design/portofolioDesign.dart';
import 'package:myporto/section/portofolio/header/portofolio.dart';
import 'package:myporto/section/portofolio/photography/portofolioPhoto.dart';
import 'package:myporto/utils/const.dart';
import 'package:myporto/widget/theme_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'about/about.dart';
import 'home/home.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0);
  ItemScrollController _itemScrollController = ItemScrollController();

  // var _sectionName = ["Home", "About", "Contact"];

  var pos = 2;

  void _scroll(int i) {
    _itemScrollController.scrollTo(index: i, duration: Duration(seconds: 1));
  }

  void _testScroll() {
    _scroll(pos);
    switch (pos) {
      case 5:
        pos = 7;
        break;
      case 7:
        pos = 1;
        break;
      default:
        pos++;
    }
  }

  Widget _changeIcon() {
    return Icon(
      (pos == 1) ? Icons.arrow_upward_outlined : Icons.arrow_downward_outlined,
    );
  }

  Widget _sectionWidget(int i) {
    switch (i) {
      case 1:
        return HomePage();
        break;
      case 2:
        return AboutPage();
        break;
      case 3:
        return Portofolio();
        break;
      case 4:
        return PortoPhotography();
        break;
      case 5:
        return PortoDesign();
        break;
      case 6:
        return Contact();
        break;
      case 7:
        return FooterPage();
        break;
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: RawScrollbar(
                controller: _scrollController,
                // thumbColor: primaryColor,
                thickness: 2.0,
                child: ScrollablePositionedList.builder(
                    itemScrollController: _itemScrollController,
                    itemCount: 8,
                    itemBuilder: (context, i) {
                      return _sectionWidget(i);
                    }),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(1.0, 10.0, 10.0, 5.0),
              alignment: Alignment.topRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _testScroll();
                      setState(() {
                        _changeIcon();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          IconButton(
                            icon: ThemeSwitcher.of(context).isDarkMode
                                ? Icon(Icons.wb_sunny)
                                : Icon(Icons.brightness_2),
                            onPressed: () =>
                                ThemeSwitcher.of(context).switchDarkMode(),
                          ),
                          Container(
                            width: 20,
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          _changeIcon()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
