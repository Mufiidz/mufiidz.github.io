import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myporto/models/pinned_github.dart';
import 'package:myporto/res/export_res.dart';
import 'package:myporto/utils/utils_export.dart';

class ItemPortfolio extends StatefulWidget {
  final PinnedGithub pinnedGithub;
  final double sizeTitle;
  final double sizeDesc;
  final double sizeLang;
  const ItemPortfolio(
      {Key? key,
      required this.pinnedGithub,
      required this.sizeTitle,
      required this.sizeDesc,
      required this.sizeLang})
      : super(key: key);

  @override
  State<ItemPortfolio> createState() => _ItemPortfolioState();
}

class _ItemPortfolioState extends State<ItemPortfolio> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isHover ? 20 : 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => OpenLink.withLink(widget.pinnedGithub.link),
        onHover: (value) => setState(() {
          isHover = value;
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.pinnedGithub.repo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.nunito(
                        textStyle: context.textTheme.headlineMedium,
                        fontSize: widget.sizeTitle,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pinnedGithub.description,
                        maxLines: 2,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: widget.sizeDesc,
                        ),
                      ),
                      _languageWidget(widget.pinnedGithub)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _languageWidget(PinnedGithub pinnedGithub) {
    String language = pinnedGithub.language;
    String languageColor = pinnedGithub.languageColor;
    bool isLanguageEmpty = language.isEmpty && languageColor.isEmpty;
    return isLanguageEmpty
        ? Container()
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                    color: HexColor(widget.pinnedGithub.languageColor),
                    shape: BoxShape.circle),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.pinnedGithub.language,
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: widget.sizeLang,
                ),
              )
            ],
          );
  }
}
