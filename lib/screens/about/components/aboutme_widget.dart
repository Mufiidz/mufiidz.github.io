import 'package:flutter/material.dart';
import 'package:myporto/models/porto.dart';
import 'package:myporto/utils/utils_export.dart';

import '../../../widget/base_button.dart';
import '../../../widget/title_section_widget.dart';

class AboutMeWidget extends StatelessWidget {
  final bool isCenter;
  final Porto porto;
  const AboutMeWidget({Key? key, this.isCenter = false, required this.porto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        TitleSectionWidget(title: 'About ${porto.id}'),
        const SizedBox(
          height: 10,
        ),
        Text(
          "I am Rifqi Mufidianto, I live in Indonesia in the city of Bekasi. I am interested in mobile development, especially for Android, photography and design. And here's my portfolio.",
          textAlign: isCenter ? TextAlign.justify : TextAlign.start,
          textScaleFactor: 1.1,
          style: context.textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 50,
        ),
        BaseButton(
          text: 'Download CV',
          onClick: () async => await OpenLink.withLink(porto.link.isNotEmpty
              ? porto.link
              : 'https://go.mufidz.my.id/onlineCV'),
        )
      ],
    );
  }
}
