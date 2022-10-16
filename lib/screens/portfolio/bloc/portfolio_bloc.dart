import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/data/remote/github_repository.dart';
import 'package:myporto/models/pinned_github.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GithubRepository _githubRepository;
  PortfolioBloc(this._githubRepository) : super(const PortfolioState()) {
    on<GetPinnedRepositoryGitEvent>((event, emit) async {
      emit(PortfolioLoadingState());
      final response = await _githubRepository.getPinnedGithub();
      emit(PortfolioDataState(response));
    });
  }
}
