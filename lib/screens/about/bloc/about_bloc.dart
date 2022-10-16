import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myporto/data/firebase/firebase_repository.dart';

import '../../../models/porto.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final FirebaseRepository _firebaseRepository;
  AboutBloc(this._firebaseRepository) : super(const AboutState()) {
    on<GetAboutEvent>((event, emit) async {
      emit(AboutLoadingState());
      final response = await _firebaseRepository.getAbout();
      emit(AboutDataState(response.last));
    });
  }
}
