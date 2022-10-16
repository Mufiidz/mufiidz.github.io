import 'package:flutter/material.dart';
import 'package:myporto/res/mycolors.dart';
import 'package:myporto/screens/header/components/image_header_widget.dart';
import 'package:myporto/screens/header/components/title_header_widget.dart';
import 'package:myporto/utils/utils_export.dart';

class HeaderDesktopSection extends StatelessWidget {
  final bool isDarkMode;
  const HeaderDesktopSection({Key? key, required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              MyColors.blue,
              (isDarkMode ? Colors.transparent : MyColors.vanila)
            ])),
        height: context.mediaSize.height,
        child: FractionallySizedBox(
          widthFactor: 0.72,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TitleHeaderWidget(
                  textNameStyle: context.textTheme.displayLarge,
                ),
              ),
              Expanded(
                  child: ImageHeaderWidget(
                align: Alignment.centerRight,
                size: 200,
                isDarkMode: isDarkMode,
              ))
            ],
          ),
        ));
  }
}
