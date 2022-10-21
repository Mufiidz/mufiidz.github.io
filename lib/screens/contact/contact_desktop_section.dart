import 'package:flutter/material.dart';
import 'package:myporto/screens/footer/footer_section.dart';
import 'package:myporto/utils/utils_export.dart';
import 'package:myporto/widget/base_button.dart';
import 'package:myporto/widget/title_section_widget.dart';

class ContactDesktopSection extends StatelessWidget {
  final bool isMobile;
  final bool isDarkMode;
  const ContactDesktopSection(
      {Key? key, this.isMobile = false, required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaSize.width,
      height: context.mediaSize.height,
      child: FractionallySizedBox(
        widthFactor: 0.72,
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleSectionWidget(title: 'Contact Me'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "It was a pleasure having you browse around this. If you have any questions, want me on your team, or just want to say hi . . Let's be friends!",
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BaseButton(
                      text: 'Say Hello',
                      onClick: () => _sendEmail(),
                    )
                  ],
                )),
            Expanded(
                child: FooterSection(
              isMobile: isMobile,
              isDarkMode: isDarkMode,
            )),
          ],
        ),
      ),
    );
  }

  _sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'pm@mufidz.my.id',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Hello Rifqi Mufidianto ( Mufidz )',
        'body': 'Hello Rifqi! (write message here)'
      }),
    );
    OpenLink.withLink(emailLaunchUri);
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
