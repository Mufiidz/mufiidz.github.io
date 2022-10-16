part of 'photo_bloc.dart';

class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoLoadingState extends PhotoState {}

class PhotoDataState extends PhotoState {
  final List<Porto> listPhoto;

  const PhotoDataState(this.listPhoto);

  @override
  List<Object> get props => [listPhoto];
}
