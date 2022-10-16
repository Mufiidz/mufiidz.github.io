import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/firebase/firebase_repository.dart';
import '../../../models/porto.dart';

part 'design_event.dart';
part 'design_state.dart';

class DesignBloc extends Bloc<DesignEvent, DesignState> {
  final FirebaseRepository _firebaseRepository;
  DesignBloc(this._firebaseRepository) : super(const DesignState()) {
    on<GetPortoDesignEvent>((event, emit) async {
      emit(DesignLoadingState());
      final response = await _firebaseRepository.getPortoDesign();
      emit(DesignDataState(response));
    });
  }
}
