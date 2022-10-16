import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/data/firebase/firebase_repository.dart';
import 'package:myporto/di/main_module.dart';
import 'package:myporto/screens/about/bloc/about_bloc.dart';
import 'package:myporto/widget/responsive_layout.dart';
import 'package:myporto/screens/design/bloc/design_bloc.dart';
import 'package:myporto/screens/photo/bloc/photo_bloc.dart';
import 'package:myporto/screens/portfolio/bloc/portfolio_bloc.dart';

import '../../bloc/theme_mode_bloc.dart';
import '../../data/remote/github_repository.dart';
import 'home_desktop_screen.dart';
import 'home_mobile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AboutBloc(getIt<FirebaseRepository>())..add(GetAboutEvent())),
        BlocProvider(
            create: (context) => PortfolioBloc(getIt<GithubRepository>())
              ..add(GetPinnedRepositoryGitEvent())),
        BlocProvider(
            create: (context) => PhotoBloc(getIt<FirebaseRepository>())
              ..add(GetPortoPhotoEvent())),
        BlocProvider(
            create: (context) => DesignBloc(getIt<FirebaseRepository>())
              ..add(GetPortoDesignEvent()))
      ],
      child: Scaffold(
        body: BlocSelector<ThemeModeBloc, ThemeModeState, bool>(
          selector: (state) => state.isDarkMode,
          builder: (context, state) {
            return ResponsiveLayout(
              mobileWidget: HomeMobileScreen(
                isDarkMode: state,
              ),
              desktopWidget: HomeDesktopScreen(
                isDarkMode: state,
              ),
            );
          },
        ),
      ),
    );
  }
}
