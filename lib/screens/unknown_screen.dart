import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/res/export_res.dart';
import 'package:myporto/route/app_route.dart';
import 'package:myporto/screens/footer/footer_section.dart';
import 'package:myporto/utils/utils_export.dart';
import 'package:myporto/widget/base_button.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Page Not Found",
      color: Colors.black,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.85,
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '404',
                          style: GoogleFonts.montserrat(
                              textStyle: context.textTheme.displayLarge
                                  ?.copyWith(
                                      color: MyColors.primary,
                                      fontWeight: FontWeight.w900)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Halaman tidak ditemukan',
                          style: context.textTheme.displaySmall?.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BaseButton(
                          text: 'Back to Home',
                          onClick: () =>
                              context.replaceRoute(const HomeRoute()),
                        )
                      ],
                    ),
                  ),
                  const Expanded(child: FooterSection())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
