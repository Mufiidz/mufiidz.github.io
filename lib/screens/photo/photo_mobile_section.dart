import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/utils/utils_export.dart';

import '../../res/export_res.dart';
import '../../widget/widget_export.dart';
import '../design/components/item_design_widget.dart';
import 'bloc/photo_bloc.dart';

class PhotoMobileSection extends StatelessWidget {
  const PhotoMobileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mediaSize.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [MyColors.lightBlue, MyColors.green])),
      child: FractionallySizedBox(
        widthFactor: 0.85,
        heightFactor: 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
                child: Center(child: TitleSectionWidget(title: 'Photography'))),
            Expanded(
                flex: 4,
                child: BlocBuilder<PhotoBloc, PhotoState>(
                  builder: (context, state) {
                    if (state is PhotoLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is PhotoDataState) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.listPhoto.length,
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) => ItemDesignWidget(
                            image: state.listPhoto[index].image),
                      );
                    }
                    return Container();
                  },
                )),
            Expanded(
                child: Center(
              child: BaseButton(
                text: 'See more',
                onClick: () => OpenLink.withLink('https://go.mufidz.my.id/ig'),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
