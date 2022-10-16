import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_mode_event.dart';
part 'theme_mode_state.dart';

class ThemeModeBloc extends Bloc<ThemeModeEvent, ThemeModeState> {
  ThemeModeBloc() : super(const ThemeModeState()) {
    on<DarkModeEvent>(
        (event, emit) => emit(state.copyWith(isDarkMode: event.isDarkMode)));
  }
}
