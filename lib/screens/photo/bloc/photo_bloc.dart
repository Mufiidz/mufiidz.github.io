import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/data/firebase/firebase_repository.dart';
import 'package:myporto/models/porto.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final FirebaseRepository _firebaseRepository;
  PhotoBloc(this._firebaseRepository) : super(const PhotoState()) {
    on<GetPortoPhotoEvent>((event, emit) async {
      emit(PhotoLoadingState());
      final response = await _firebaseRepository.getPortoPhoto();
      emit(PhotoDataState(response));
    });
  }
}
