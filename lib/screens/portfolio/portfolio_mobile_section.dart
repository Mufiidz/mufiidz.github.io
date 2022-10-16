import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/utils/utils_export.dart';

import '../../res/export_res.dart';
import '../../widget/widget_export.dart';
import 'bloc/portfolio_bloc.dart';
import 'component/item_portfolio.dart';

class PortfolioMobileSection extends StatelessWidget {
  const PortfolioMobileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mediaSize.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [MyColors.darkPurple, MyColors.purple])),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                TitleSectionWidget(title: 'Portfolio'),
                Text(
                  'Ini adalah beberapa project yang sudah atau sedang dikerjakan.',
                  textAlign: TextAlign.center,
                ),
              ],
            )),
            Expanded(
                flex: 4,
                child: BlocBuilder<PortfolioBloc, PortfolioState>(
                  builder: (context, state) {
                    if (state is PortfolioLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is PortfolioDataState) {
                      return GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: context.mediaSize.width /
                            context.mediaSize.height /
                            (context.mediaSize.width >= 300 ? 0.4 : 0.3),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 3,
                        children:
                            List.generate(state.pinnedGithub.length, (index) {
                          return ItemPortfolio(
                              pinnedGithub: state.pinnedGithub[index],
                              sizeTitle: context.mediaSize.width * 0.035,
                              sizeDesc: context.mediaSize.width * 0.025,
                              sizeLang: context.mediaSize.width * 0.02);
                        }),
                      );
                    }
                    return Container();
                  },
                )),
            Expanded(
                child: Center(
              child: BaseButton(
                text: 'See more',
                onClick: () => OpenLink.withLink('https://github.com/Mufiidz'),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
