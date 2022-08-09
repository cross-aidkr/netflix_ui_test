import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/screens/profile/authbloc/auth_event.dart';
import 'package:netflix_ui/screens/profile/authbloc/auth_state.dart';
import 'package:profile_repository/profile_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ProfileRepository profileRepository;

  AuthBloc({
    required this.profileRepository,
  }) : super(Empty()) {
    on<GetAuth>(_onGetAuthResponse);
    on<Get2Auth>(_onGet2AuthResponse);
  }

  @override
  AuthState get initialState => Empty();

  var isClicked = false;

  void _onGetAuthResponse(GetAuth event, Emitter<AuthState> emit) async {
    try {
      print("_onGetAuthResponse");
      emit(Empty());

      emit(Loading());
      profileRepository.saveProfile(event.profile);

      print("_onGetAuthResponse isClicked : $isClicked");
      emit(LoadedAuth(profile: event.profile));
    } catch (_) {
      emit(Error(message: "error"));
    }
  }

  var count = 0;

  void _onGet2AuthResponse(Get2Auth event, Emitter<AuthState> emit) async {
    try {
      print("_onGet2AuthResponse");
      emit(Empty());
      emit(Loading());
      print("count : $count");
      profileRepository.saveProfile(event.profile);
      emit(LoadedAuth2(profile: event.profile, count: count++));
    } catch (_) {
      emit(Error(message: "error"));
    }
  }
}
