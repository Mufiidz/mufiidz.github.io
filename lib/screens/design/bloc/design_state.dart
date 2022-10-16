part of 'design_bloc.dart';

class DesignState extends Equatable {
  const DesignState();

  @override
  List<Object> get props => [];
}

class DesignLoadingState extends DesignState {}

class DesignDataState extends DesignState {
  final List<Porto> listDesign;

  const DesignDataState(this.listDesign);

  @override
  List<Object> get props => [listDesign];
}
