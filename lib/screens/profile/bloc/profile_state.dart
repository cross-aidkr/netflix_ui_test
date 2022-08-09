part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class LoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class InitialState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileSuccessState extends ProfileState {
  const ProfileSuccessState({required this.entries});

  final List<Profile> entries;

  @override
  List<Object?> get props => [entries];
}

class ProfileFailureState extends ProfileState {
  @override
  List<Object?> get props => [];
}
