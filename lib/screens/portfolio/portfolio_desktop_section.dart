import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/screens/portfolio/component/item_portfolio.dart';
import 'package:myporto/utils/utils_export.dart';
import 'package:myporto/widget/base_button.dart';
import 'package:myporto/widget/title_section_widget.dart';

import '../../res/mycolors.dart';
import 'bloc/portfolio_bloc.dart';

class PortfolioDesktopSection extends StatelessWidget {
  const PortfolioDesktopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [MyColors.darkPurple, MyColors.purple])),
        height: context.mediaSize.height,
        child: FractionallySizedBox(
          widthFactor: 0.72,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        TitleSectionWidget(title: 'Portfolio'),
                        Text(
                          'Ini adalah beberapa project yang sudah atau sedang dikerjakan.',
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child:
                      Center(child: BlocBuilder<PortfolioBloc, PortfolioState>(
                    builder: (context, state) {
                      if (state is PortfolioLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is PortfolioDataState) {
                        return state.pinnedGithub.length <= 2
                            ? Wrap(
                                runSpacing: 4,
                                spacing: 4,
                                alignment: WrapAlignment.center,
                                children: List.generate(
                                    state.pinnedGithub.length, (index) {
                                  return SizedBox(
                                    width: 300,
                                    height: 200,
                                    child: ItemPortfolio(
                                        pinnedGithub: state.pinnedGithub[index],
                                        sizeTitle:
                                            context.mediaSize.width * 0.022,
                                        sizeDesc:
                                            context.mediaSize.width * 0.012,
                                        sizeLang:
                                            context.mediaSize.width * 0.012),
                                  );
                                }),
                              )
                            : GridView.count(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                crossAxisCount:
                                    context.mediaSize.width >= 700 ? 3 : 2,
                                childAspectRatio: context.mediaSize.width /
                                    context.mediaSize.height /
                                    (context.mediaSize.width >= 700
                                        ? 1.04
                                        : 0.4),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 3,
                                children: List.generate(
                                    state.pinnedGithub.length, (index) {
                                  return ItemPortfolio(
                                      pinnedGithub: state.pinnedGithub[index],
                                      sizeTitle:
                                          context.mediaSize.width * 0.022,
                                      sizeDesc: context.mediaSize.width * 0.012,
                                      sizeLang:
                                          context.mediaSize.width * 0.012);
                                }),
                              );
                      }
                      return Container();
                    },
                  ))),
              Expanded(
                  child: Center(
                child: BaseButton(
                  text: 'See more',
                  onClick: () =>
                      OpenLink.withLink('https://github.com/Mufiidz'),
                ),
              )),
            ],
          ),
        ));
  }
}
