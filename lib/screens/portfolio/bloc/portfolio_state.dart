part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object> get props => [];
}

class PortfolioLoadingState extends PortfolioState {}

class PortfolioDataState extends PortfolioState {
  final List<PinnedGithub> pinnedGithub;

  const PortfolioDataState(this.pinnedGithub);

  @override
  List<Object> get props => [pinnedGithub];
}
