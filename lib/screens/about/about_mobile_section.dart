import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/screens/about/components/aboutme_widget.dart';
import 'package:myporto/screens/about/components/image_profile_widget.dart';
import 'package:myporto/utils/utils_export.dart';

import 'bloc/about_bloc.dart';

class AboutMobileSection extends StatelessWidget {
  const AboutMobileSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mediaSize.height,
      child: FractionallySizedBox(
        widthFactor: 0.85,
        heightFactor: 0.8,
        child: BlocBuilder<AboutBloc, AboutState>(
          builder: (context, state) {
            if (state is AboutLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AboutDataState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2, child: ImageProfileWidget(state.about.image)),
                  Expanded(
                      flex: 3,
                      child: AboutMeWidget(
                        isCenter: true,
                        porto: state.about,
                      )),
                ],
              );
            }
            return const Center(
              child: Text('No Data'),
            );
          },
        ),
      ),
    );
  }
}
