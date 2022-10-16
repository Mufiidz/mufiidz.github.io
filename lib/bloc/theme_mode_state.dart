part of 'theme_mode_bloc.dart';

class ThemeModeState extends Equatable {
  final bool isDarkMode;

  const ThemeModeState({this.isDarkMode = false});

  @override
  List<Object> get props => [isDarkMode];

  ThemeModeState copyWith({
    bool? isDarkMode,
  }) {
    return ThemeModeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
