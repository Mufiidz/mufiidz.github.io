part of 'theme_mode_bloc.dart';

abstract class ThemeModeEvent extends Equatable {
  const ThemeModeEvent();

  @override
  List<Object> get props => [];
}

class DarkModeEvent extends ThemeModeEvent {
  final bool isDarkMode;

  const DarkModeEvent(this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];
}
