import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/theme_mode_bloc.dart';

class MobileAppbar extends StatelessWidget {
  final bool isDarkMode;
  final bool isTop;

  const MobileAppbar({
    Key? key,
    required this.isDarkMode,
    required this.isTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: FractionallySizedBox(
        widthFactor: 0.9,
        heightFactor: 0.08,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
                shape: const StadiumBorder(),
                title: isTop
                    ? null
                    : Text(
                        'Rifqi Mufidianto',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontFamily: 'Windlass',
                            fontSize: 18,
                            color: isDarkMode ? Colors.white : Colors.black),
                      ),
                backgroundColor: isTop
                    ? Colors.transparent
                    : (isDarkMode ? Colors.black : Colors.white)
                        .withOpacity(0.5),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                        onPressed: () => context
                            .read<ThemeModeBloc>()
                            .add(DarkModeEvent(!isDarkMode)),
                        icon: Icon(
                          isDarkMode ? Icons.wb_sunny : Icons.dark_mode,
                          color: isDarkMode ? Colors.white : Colors.black,
                        )),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
