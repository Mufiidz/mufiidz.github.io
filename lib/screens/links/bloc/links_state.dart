part of 'links_bloc.dart';

class LinksState extends Equatable {
  const LinksState();

  @override
  List<Object> get props => [];
}

class LinksLoadingState extends LinksState {}

class LinksDataState extends LinksState {
  final List<Link> listLinks;

  const LinksDataState(this.listLinks);

  @override
  List<Object> get props => [listLinks];
}
