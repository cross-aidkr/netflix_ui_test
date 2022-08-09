import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/screens/profile/bloc/profile_event.dart';
import 'package:netflix_ui/screens/profile/bloc/profile_state.dart';
import 'package:profile_repository/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({
    required this.profileRepository,
  }) : super(Empty()) {
    on<GetProfile>(_onGetProfileResponse);
    on<SaveProfile>(_onSaveProfileResponse);
  }

  @override
  ProfileState get initialState => Empty();

  void _onGetProfileResponse(GetProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(Empty());

      emit(Loading());
      final result = await profileRepository.fetchProfile();
      emit(LoadedProfiles(profiles: result));
    } catch (_) {
      emit(Error(message: "error"));
    }
  }

  void _onSaveProfileResponse(SaveProfile event, Emitter<ProfileState> emit) async {
    try {
      emit(Empty());

      emit(Loading());
      profileRepository.saveProfile(event.profile);
      emit(LoadedProfile(profile: event.profile));
    } catch (_) {
      emit(Error(message: "error"));
    }
  }

}
