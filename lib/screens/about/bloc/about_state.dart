part of 'about_bloc.dart';

class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object> get props => [];
}

class AboutLoadingState extends AboutState {}

class AboutDataState extends AboutState {
  final Porto about;

  const AboutDataState(this.about);

  @override
  List<Object> get props => [about];
}
