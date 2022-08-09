import 'package:equatable/equatable.dart';
import 'package:profile_repository/profile_repository.dart';

abstract class ProfileState extends Equatable{
  ProfileState([List props = const <dynamic>[]]) : super();
}

class Empty extends ProfileState {
  @override
  List<Object?> get props => [];
}

class Loading extends ProfileState{
  @override
  List<Object?> get props => [];
}


class LoadedProfiles extends ProfileState{
  final List<Profile> profiles;

  LoadedProfiles({
    required this.profiles
  }) : super();

  @override
  List<Object?> get props => [profiles];
}

class LoadedProfile extends ProfileState{
  final Profile profile;

  LoadedProfile({
    required this.profile
  }) : super();

  @override
  List<Object?> get props => [profile];
}

class Error extends ProfileState{
  final String message;

  Error({
    required this.message
  }) : super();

  @override
  List<Object?> get props => [message];
}