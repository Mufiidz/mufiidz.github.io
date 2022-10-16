import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/screens/about/components/aboutme_widget.dart';
import 'package:myporto/screens/about/components/image_profile_widget.dart';
import 'package:myporto/utils/utils_export.dart';

import 'bloc/about_bloc.dart';

class AboutDesktopSection extends StatelessWidget {
  const AboutDesktopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.mediaSize.height,
        child: FractionallySizedBox(
          widthFactor: 0.72,
          child: BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              if (state is AboutLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is AboutDataState) {
                return Row(
                  children: [
                    Expanded(child: AboutMeWidget(porto: state.about)),
                    Expanded(child: ImageProfileWidget(state.about.image)),
                  ],
                );
              }
              return const Center(
                child: Text('No Data'),
              );
            },
          ),
        ));
  }
}
