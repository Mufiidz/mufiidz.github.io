import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/bloc/theme_mode_bloc.dart';
import 'package:myporto/screens/home/component/button_text.dart';
import 'package:myporto/utils/utils_export.dart';

class DesktopAppbar extends StatelessWidget {
  final bool isTop;
  final ScrollController controller;
  const DesktopAppbar({Key? key, required this.isTop, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: PreferredSize(
        preferredSize: Size(
          context.mediaSize.width,
          56,
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: BlocSelector<ThemeModeBloc, ThemeModeState, bool>(
              selector: (state) => state.isDarkMode,
              builder: (context, state) {
                return AppBar(
                  title: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => _animateToIndex(0, context),
                      child: Text(
                        'Rifqi Mufidianto',
                        textScaleFactor: 1.2,
                        style: TextStyle(
                            fontFamily: 'Windlass',
                            fontSize: 20,
                            color: state ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  elevation: 0,
                  backgroundColor: isTop
                      ? Colors.transparent
                      : (state ? Colors.black : Colors.white).withOpacity(0.5),
                  actions: [
                    ButtonText(
                      text: 'About',
                      onClick: () => _animateToIndex(1, context),
                      isDarkMode: state,
                    ),
                    ButtonText(
                      text: 'Portfolio',
                      onClick: () => _animateToIndex(2, context),
                      isDarkMode: state,
                    ),
                    ButtonText(
                      text: 'Contact',
                      onClick: () => _animateToIndex(5, context),
                      isDarkMode: state,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: IconButton(
                          onPressed: () => context
                              .read<ThemeModeBloc>()
                              .add(DarkModeEvent(!state)),
                          icon: Icon(
                            state ? Icons.wb_sunny : Icons.dark_mode,
                            color: state ? Colors.white : Colors.black,
                          )),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _animateToIndex(double index, BuildContext context) {
    controller.animateTo(
      index * context.mediaSize.height,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }
}
