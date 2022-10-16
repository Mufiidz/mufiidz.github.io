import 'package:flutter/material.dart';
import 'package:myporto/screens/header/components/image_header_widget.dart';
import 'package:myporto/screens/header/components/title_header_widget.dart';
import 'package:myporto/utils/utils_export.dart';

import '../../res/export_res.dart';

class HeaderMobileSection extends StatelessWidget {
  final bool isDarkMode;
  const HeaderMobileSection({Key? key, required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mediaSize.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            MyColors.blue,
            (isDarkMode ? Colors.transparent : MyColors.vanila)
          ])),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: TitleHeaderWidget(
                    textNameStyle: context.textTheme.displayMedium)),
            Expanded(
                child: ImageHeaderWidget(
              align: Alignment.bottomRight,
              size: 200,
              isDarkMode: isDarkMode,
            )),
          ],
        ),
      ),
    );
  }
}
