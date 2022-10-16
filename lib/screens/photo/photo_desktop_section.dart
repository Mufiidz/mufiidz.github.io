import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/screens/photo/components/button_next_widget.dart';
import 'package:myporto/utils/utils_export.dart';
import 'package:myporto/widget/widget_export.dart';

import '../../res/mycolors.dart';
import 'bloc/photo_bloc.dart';

class PhotoDesktopSection extends StatefulWidget {
  const PhotoDesktopSection({Key? key}) : super(key: key);

  @override
  State<PhotoDesktopSection> createState() => _PhotoDesktopSectionState();
}

class _PhotoDesktopSectionState extends State<PhotoDesktopSection> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [MyColors.lightBlue, MyColors.green])),
        height: context.mediaSize.height,
        child: FractionallySizedBox(
          widthFactor: 0.72,
          child: Column(
            children: [
              const Expanded(
                  child:
                      Center(child: TitleSectionWidget(title: 'Photography'))),
              Expanded(
                flex: 6,
                child: FractionallySizedBox(
                  widthFactor: 0.7,
                  child: BlocBuilder<PhotoBloc, PhotoState>(
                    builder: (context, state) {
                      if (state is PhotoLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is PhotoDataState) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                                child: ButtonNextWidget(
                              icon: Icons.chevron_left,
                              onClick: () => setState(() {
                                index == 0
                                    ? index = (state.listPhoto.length - 1)
                                    : index--;
                              }),
                            )),
                            Flexible(
                              flex: 6,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    state.listPhoto[index].image,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                                child: ButtonNextWidget(
                              icon: Icons.chevron_right,
                              onClick: () => setState(() {
                                (index + 1) == state.listPhoto.length
                                    ? index = 0
                                    : index++;
                              }),
                            )),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                child: BaseButton(
                  text: 'See more',
                  onClick: () =>
                      OpenLink.withLink('https://go.mufidz.my.id/ig'),
                ),
              ))
            ],
          ),
        ));
  }
}
