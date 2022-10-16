import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/screens/design/components/item_design_widget.dart';
import 'package:myporto/screens/design/components/moveable_widget.dart';
import 'package:myporto/utils/utils_export.dart';
import 'package:myporto/widget/title_section_widget.dart';

import '../../res/mycolors.dart';
import '../../widget/base_button.dart';
import 'bloc/design_bloc.dart';

class DesignDesktopSection extends StatelessWidget {
  const DesignDesktopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        height: context.mediaSize.height,
        child: Stack(
          children: [
            MoveableWidget(
              top: context.mediaSize.height - 140,
              left: -30,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [MyColors.darkPurple, MyColors.purple])),
              ),
            ),
            MoveableWidget(
              top: context.mediaSize.height / 2,
              left: context.mediaSize.width - 140,
              child: Container(
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [MyColors.orange, MyColors.lightOrange])),
              ),
            ),
            MoveableWidget(
              top: 100,
              left: 120,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(45 / 360),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [MyColors.lightBlue, MyColors.green])),
                ),
              ),
            ),
            Center(
              child: FractionallySizedBox(
                  widthFactor: 0.72,
                  child: Column(
                    children: [
                      const Expanded(
                          child: Center(
                        child: TitleSectionWidget(
                          title: 'Design',
                          color: Colors.white,
                        ),
                      )),
                      Expanded(
                          flex: 4,
                          child: Center(
                            child: BlocBuilder<DesignBloc, DesignState>(
                              builder: (context, state) {
                                if (state is DesignLoadingState) {
                                  return const CircularProgressIndicator();
                                }
                                if (state is DesignDataState) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: state.listDesign.length,
                                    clipBehavior: Clip.none,
                                    itemBuilder: (context, index) =>
                                        ItemDesignWidget(
                                            image:
                                                state.listDesign[index].image),
                                  );
                                }
                                return Container();
                              },
                            ),
                          )),
                      Expanded(
                          child: Center(
                        child: BaseButton(
                          text: 'See more',
                          onClick: () => OpenLink.withLink(
                              'https://go.mufidz.my.id/behance'),
                        ),
                      ))
                    ],
                  )),
            ),
          ],
        ));
  }
}
