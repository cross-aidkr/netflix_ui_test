import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required ProfileRepository profileRepository,
  })  : _profileRepository = profileRepository,
        super(InitialState()) {
    on<ProfileRequested>(_onProfileRequested);
  }

  final ProfileRepository _profileRepository;

  Future<void> _onProfileRequested(
      ProfileRequested event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      // emit(LoadingState());
      final entries = await _profileRepository.fetchProfile();
      emit(ProfileSuccessState(entries: entries));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(ProfileFailureState());
    }
  }
}
