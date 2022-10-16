import 'package:equatable/equatable.dart';import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/firebase/firebase_repository.dart';
import '../../../models/link.dart';

part 'links_event.dart';
part 'links_state.dart';

class LinksBloc extends Bloc<LinksEvent, LinksState> {
  final FirebaseRepository _firebaseRepository;
  LinksBloc(this._firebaseRepository) : super(const LinksState()) {
    on<GetAllLinksEvent>((event, emit) async {
      emit(LinksLoadingState());
      final response = await _firebaseRepository.getRelatedLink();
      emit(LinksDataState(response));
    });
  }
}
